// Scale-to-zero container API for a personal or demo project.
// This file deploys only the API side of the pattern. The UI stays on a
// CDN host (Cloudflare Pages or equivalent), outside this template.
//
// Deploy:
//   az group create --name <rg> --location <region>
//   az deployment group create \
//     --resource-group <rg> \
//     --template-file main.bicep \
//     --parameters appName=<name> image=ghcr.io/<user>/<repo>:<sha> corsOrigin=https://app.<your-domain>
//
// Rollback: redeploy with the previous image tag. This is why the CI
// pipeline tags every image with the git SHA, not only `latest`.

@description('Name for the container app. The environment and log workspace derive their names from it.')
param appName string

@description('Full image reference, tagged with the git SHA, for example ghcr.io/user/repo:abc1234.')
param image string

@description('Exact origin of the UI, for example https://app.example.com. Never use *.')
param corsOrigin string

@description('Port that the container listens on.')
param targetPort int = 8080

param location string = resourceGroup().location

resource logs 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: '${appName}-logs'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource env 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: '${appName}-env'
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: logs.properties.customerId
        sharedKey: logs.listKeys().primarySharedKey
      }
    }
  }
}

resource app 'Microsoft.App/containerApps@2024-03-01' = {
  name: appName
  location: location
  properties: {
    managedEnvironmentId: env.id
    configuration: {
      ingress: {
        external: true
        targetPort: targetPort
        corsPolicy: {
          allowedOrigins: [
            corsOrigin
          ]
        }
      }
      // CUSTOMIZE: for a private registry, add a `registries` block here and
      // put the credential in a secret. A public GHCR image needs neither.
    }
    template: {
      containers: [
        {
          name: appName
          image: image
          resources: {
            // The smallest size that passes a load of one user. Raise it
            // only with a measured reason.
            cpu: json('0.25')
            memory: '0.5Gi'
          }
        }
      ]
      scale: {
        // minReplicas 0 is the whole point: idle cost stays near zero.
        minReplicas: 0
        maxReplicas: 1
        rules: [
          {
            name: 'http'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
        ]
      }
    }
  }
}

output apiUrl string = 'https://${app.properties.configuration.ingress.fqdn}'
