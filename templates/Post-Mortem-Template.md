# Post-Mortem: <incident title>

> Keep the post-mortem blameless. Do not ask who caused the incident. Ask what allowed it. Assume that each person acted reasonably with the information that they had. Fix the system, not the person.

| Field | Value |
|---|---|
| **Incident date** | <YYYY-MM-DD> |
| **Duration** | <detected HH:MM → resolved HH:MM (timezone)> |
| **Severity** | <Sev1–Sev4, with a one-line user impact> |
| **Author** | <name> |
| **Related tickets** | <links> |

## Summary

<3–4 sentences that a VP can read: what broke, who it affected, how long it lasted, and how you fixed it.>

## Impact

- **Users/customers:** <who, how many, and what they experienced>
- **Data:** <lost / corrupted / delayed / none>
- **Business:** <revenue, SLA, reputation; give numbers where possible>

## Timeline

> Give facts only, with timestamps. Record what you knew or believed at each moment. Put hindsight in the analysis, not here.

| Time | What happened and what we did |
|---|---|
| <HH:MM> | <the first bad deploy or the trigger event> |
| <HH:MM> | <the first alert or report; note the delay after the trigger> |
| <HH:MM> | <the key investigation steps, with the incorrect paths> |
| <HH:MM> | <the mitigation that you applied> |
| <HH:MM> | <the time when you confirmed the resolution> |

## Root cause analysis

<A five-whys analysis or a causal chain. Repeat the question "why was that possible?" until the answer is a process or a system, not a person.>

**Contributing factors:** <the things that made the incident worse or slower to find: a missing alert, an old runbook, knowledge that no document records>

## What worked and what did not work

- ✅ <for example, the rollback script existed and worked>
- ❌ <for example, detection took 40 minutes because no alert covered the queue depth>

## Action items

> Give each item an owner and a ticket. An item without an owner and a ticket is a wish, not an action.

| Action | Type | Owner | Ticket | Due |
|---|---|---|---|---|
| <fix the defect> | Prevent | | | |
| <add an alert on the signal that finds this incident in 2 minutes> | Detect | | | |
| <update the runbook or the rollback script> | Mitigate | | | |
| <remove the full class of error (validation, type, constraint)> | Eliminate | | | |
