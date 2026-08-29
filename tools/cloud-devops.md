# Cloud & DevOps Tools

This list prefers Azure tools, because the maintainer's personal projects run there. Adjust it for your cloud. The container, IaC, and CI tools apply everywhere.

## Azure

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/) | Free | Scriptable control of everything in Azure | If you click a task twice in the Portal, make the task an `az` command in a script |
| [Azure Storage Explorer](https://azure.microsoft.com/en-us/products/storage/storage-explorer/) | Free | A GUI for blobs, queues, tables, and files | Browse and download blobs and poison-queue messages without code |
| [Service Bus Explorer](https://github.com/paolosalvatori/ServiceBusExplorer) | Free | Peek, send, and resubmit Service Bus messages | Use it during an incident to inspect a dead-letter queue and to resubmit messages. No other tool replaces it |
| [Azurite](https://github.com/Azure/Azurite) | Free | A local Azure Storage emulator | Develop and test storage code offline. You need no cloud resources and pay no costs |
| [Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview) + KQL | Paid (usage) | APM: requests, dependencies, exceptions, distributed traces | Learn KQL well. One good query shows what changed at 2:14 PM. A manual log search takes an hour |

## Containers & orchestration

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Docker](https://www.docker.com/) / [OrbStack](https://orbstack.dev/) (macOS) | Free/Paid | Containers. OrbStack is a faster, lighter Docker Desktop for Mac | The container image gives the same environment on every machine |
| [k9s](https://k9scli.io/) | Free | A terminal UI for Kubernetes | Navigate pods, logs, and exec sessions with the keyboard. It needs far fewer keystrokes than kubectl |
| [Lens](https://k8slens.dev/) | Freemium | A Kubernetes IDE | It is the GUI equivalent of k9s. Use it for dashboards and multi-cluster views |

## Infrastructure as code & CI/CD

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Terraform](https://developer.hashicorp.com/terraform) / [OpenTofu](https://opentofu.org/) | Free | Declarative IaC across clouds | Environments become PRs that the team can review. Git shows how each environment was configured |
| [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/) | Free | Azure-native IaC, cleaner than ARM JSON | If you use only Azure, Bicep gives you ARM features with simpler syntax |
| [GitHub CLI (gh)](https://cli.github.com/) | Free | PRs, issues, releases, and the API from the terminal | `gh pr create --fill` and `gh run watch` remove the need for the browser |
| [act](https://github.com/nektos/act) | Free | Runs GitHub Actions locally | Debug workflow YAML locally. You do not need many test commits to the remote repo |
| [pre-commit](https://pre-commit.com/) | Free | Managed git hooks (lint, format, secrets scan) | It finds simple errors before they reach CI or a reviewer |

## Principles

- **Use the Portal to look. Use code to make changes.** A change made in a GUI is invisible to review, and you cannot repeat it.
- Make sure that a new hire can follow each pipeline and deploy to production on day 2.
