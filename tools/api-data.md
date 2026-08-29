# API & Data Tools

Stack-neutral tools for API development, observability, and database work. Language-specific and engine-specific tooling belongs in your own fork of this list.

## API development

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Bruno](https://www.usebruno.com/) | Free/Paid | An offline-first API client. Collections are plain files in your repo | Keep API collections in git next to the code, not in a personal cloud account |
| [Postman](https://www.postman.com/) | Freemium | The standard API client with collections, environments, and scripted tests | It remains the common standard to share API work across teams |
| [ngrok](https://ngrok.com/) / [VS dev tunnels](https://learn.microsoft.com/en-us/aspnet/core/test/dev-tunnels) | Freemium | Exposes localhost through a public URL | Test webhooks (Stripe, GitHub, Twilio) against your local machine without a deployment |
| [WireMock](https://wiremock.org/) | Free/Paid | An HTTP mock server, available as a standalone process or a library in most languages | Run integration tests against a mock of an unreliable third-party API. The results are deterministic |
| [k6](https://k6.io/) | Free/Paid | Load tests scripted in JavaScript | Load tests as code run in CI. This is better than one manual load session before a release |

## Observability

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [OpenTelemetry](https://opentelemetry.io/) | Free | Vendor-neutral traces, metrics, and logs | Instrument the code one time. Then send the data to any backend (App Insights, Grafana, Datadog, and others) |

For log search and query tools during an incident, see [debugging.md](debugging.md).

## Databases & migrations

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [DBeaver](https://dbeaver.io/) | Free/Paid | A universal database client (Postgres, MySQL, Oracle, SQL Server, …) | One client for every engine. It becomes important when your team adds a second database platform |
| [Flyway](https://flywaydb.org/) | Free/Paid | Versioned, repeatable database migrations | Apply the same discipline to databases as to code. Make every change a script in source control |

## Practices to use with these tools

- Ship every schema change as a script with a paired rollback script (see [workflows/task-lifecycle](../workflows/task-lifecycle/)).
- Learn indexing well one time: [Use The Index, Luke](https://use-the-index-luke.com/).
- Every outbound call needs a timeout and a retry policy with backoff. Use your platform's resilience library. Do not write this code yourself.
