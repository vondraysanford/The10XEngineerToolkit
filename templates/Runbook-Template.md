# Runbook: <system / integration name>

> Write one runbook for each integration or system, not one for each fix. Write for an on-call engineer who does not know this system. Do not assume knowledge that is not in the runbook. Make sure that the reader can copy and run each command.

| Field | Value |
|---|---|
| **System** | <name, with a one-line purpose> |
| **Owner team / SME** | <team, escalation contact> |
| **Criticality** | <what breaks for the users when this system is down> |
| **Last verified** | <the date when a person last confirmed that these steps work> |

## Quick reference

| Item | Location |
|---|---|
| Dashboards | <links> |
| Logs | <the location, with a starter query> |
| Source repo | <link> |
| Config / secrets | <the location, never the values> |
| Infra | <servers and resources, with the environment names> |
| Upstream / downstream dependencies | <what it calls, and what calls it> |

## How it works

<Short prose or a Mermaid diagram: data in → processing → data out. Give enough to reason about failures.>

## Health checks

```
<command or URL that shows that the system is healthy, with the expected output>
```

## Common failures and fixes

### Symptom: <for example, "Messages collect in queue X">
- **Likely cause:** <…>
- **Check:** `<exact command/query>`
- **Fix:** `<exact command/script link>`
- **Verify the fix:** `<command + expected output>`

### Symptom: <the next most common symptom>
- …

## Restart and recovery procedures

1. <The exact steps. If the procedure includes multiple services, give the order.>
2. <The verification after the restart>

## Escalation

- **If the steps above fail:** <who to page, in which order, and which information to have ready>
- **Vendor/third-party support:** <the portal link, and the location of the account or contract number>
