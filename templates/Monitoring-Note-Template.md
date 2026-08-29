# Monitoring Note: <change / ticket>

> Fill this note after each production change. A change is not "done" when it deploys. It is done when you have observed that it is healthy.

| Field | Value |
|---|---|
| **Change** | <a link to the PR/CR/ticket> |
| **Deployed** | <date/time, timezone, version> |
| **Watch window** | <24h / 72h / one business cycle, and the end date> |
| **Owner during window** | <name> |

## Possible failures

<The 2–3 most probable failure modes of this change. Give each one a signal below.>

## Signals to watch

| Signal | Where (link) | Healthy looks like | Checked |
|---|---|---|---|
| <the error rate on the affected endpoint or job> | <a dashboard or query link> | <for example, "< 0.1%, flat compared with last week"> | ⬜ +1h ⬜ +24h ⬜ end |
| <latency / duration> | <link> | <baseline ± range> | ⬜ ⬜ ⬜ |
| <a business metric: orders, emails sent, rows processed> | <link> | <the expected volume> | ⬜ ⬜ ⬜ |
| <dead-letter/poison queue depth> | <link> | <zero / stable> | ⬜ ⬜ ⬜ |

## Alerts

- **Existing alerts that cover this:** <links>
- **New alert added:** <yes, with a link / no, with the reason>

## Verdict at window close

- [ ] Healthy. Record the outcome in the [Impact Summary](Impact-Summary-Template.md)
- [ ] Issues found: <the issues, with the follow-up ticket or the rollback link>
