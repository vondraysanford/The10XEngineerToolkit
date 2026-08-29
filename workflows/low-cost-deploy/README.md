# Deploy: Static UI + Scale-to-Zero Container API

The repeatable deployment for a personal or demo project: a static frontend on a free CDN host, and an API container that scales to zero. Idle cost is near zero, and the project stays live for years. This runbook uses Cloudflare Pages and Azure Container Apps. Substitute equivalents if your accounts differ.

> **Customize this:** the concrete names below (Cloudflare, Azure Container Apps, GHCR) are one proven combination. The pattern is the contract: static UI on a CDN, API in a scale-to-zero container, CI with OIDC, cost guardrails before the first deploy.

## Before you start

- [ ] Complete the [Cost Guardrails checklist](../../templates/Cost-Guardrails-Checklist.md), "Before first deploy" section.
- [ ] Make sure that `.gitignore` and `.dockerignore` exist ([configs/](../../configs/)). The image must not contain secrets or git history.

## The sequence

1. **Containerize the API.** Multi-stage Dockerfile. Bake models and static artifacts into the image at build time, so that the container has no runtime registry pulls and cold starts stay predictable.
2. **Push the image from CI.** GitHub Actions builds on push to `main` and pushes to GHCR or ACR. Tag with the git SHA, not only `latest`, so that a rollback is a redeploy of a known tag.
3. **Use OIDC from CI to the cloud.** Configure federated credentials. Store no cloud keys in GitHub secrets. A key that does not exist cannot leak.
4. **Create the Container App** with min replicas 0 and max replicas 1. Confirm the scale rule triggers on HTTP. Set CPU/memory to the smallest size that passes a load of one user. [infra/main.bicep](infra/main.bicep) is a ready starter: the app, its environment, log analytics, the HTTP scale rule, and the CORS allow-list, in one deployable file.
5. **Deploy the UI to Cloudflare Pages** (or equivalent) from the repo. Set the API base URL through an environment variable at build time. Never hardcode it.
6. **Set the custom subdomains.** UI at `app.<your-domain>`, API at `api-app.<your-domain>`. Set the CORS allow-list on the API to the exact UI origin. Do not use `*`.
7. **Harden for public demo mode:**
   - [ ] Block or 403 all mutating endpoints that a demo does not need
   - [ ] Rate-limit per IP, and cap total daily usage in code
   - [ ] Cap AI token spend per request and per day (see the [Cost Guardrails checklist](../../templates/Cost-Guardrails-Checklist.md))
   - [ ] Rotate any key that was used during local testing
8. **Verify end to end.** Cold start: hit the API after 10 minutes idle and record the latency. Then run the happy path through the UI on the public URL, not on localhost.
9. **Record the result.** Put the public URL, the deploy diagram, and the idle cost number in the README. Capture the demo GIF now, while everything works.

## Rollback

- UI: redeploy the previous Pages build (one click).
- API: redeploy the previous image tag. This is why step 2 tags with the SHA.

## The principle

Use the portal to look, use code to change ([tools/cloud-devops.md](../../tools/cloud-devops.md)). Every step above must live in the repo: the Dockerfile, the workflow YAML, and the IaC ([infra/main.bicep](infra/main.bicep)). A deployment that exists only as portal clicks cannot be repeated, reviewed, or rolled back.
