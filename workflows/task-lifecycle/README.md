# Task Lifecycle

This workflow is a repeatable system that moves each task through **ticket → shipped → verified → documented → monitored**, the same way each time. Consistency gives the largest benefit. You already do all of these steps on your best tickets. This workflow makes the steps automatic on *every* ticket.

## Usage

1. If you start a task, copy the whole [Task-Template/](Task-Template/) folder. Rename the copy to your task or ticket ID (for example `TASK-1234`). One command does this: `scripts/new-task.sh TASK-1234`.
2. Fill in `DECISION.md` (the [ADR](../../templates/ADR-Template.md)) **before** you write code, while you remember the reasons. For an ambiguous or large ticket, start with a [Problem Brief](../../templates/Problem-Brief-Template.md).
3. Put the deployment scripts in `Scripts/` and the paired undo scripts in `Rollback/`. Put the validation in `Testing/`, the exploratory work in `Analysis/`, and the screenshots and plans in `Evidence/`.
4. Before you close the item, complete the [Definition of Done checklist](../../templates/Definition-of-Done-Checklist.md) from top to bottom.
5. After the deployment, fill in `MONITORING.md` and `IMPACT.md` to close the loop.
6. If the item was a production incident or defect, add a [Post-Mortem](../../templates/Post-Mortem-Template.md).

## The folder per task

```
TASK-1234/
├── DECISION.md      # the ADR: why this approach (written BEFORE coding)
├── MONITORING.md    # what to watch after deploy, for how long
├── IMPACT.md        # quantified outcome at close
├── Analysis/        # exploratory queries, spikes, notes
├── Scripts/         # every deployment step, scripted
├── Rollback/        # the paired undo for every script
├── Testing/         # executed test cases + results
└── Evidence/        # screenshots, plans, before/after
```

## How an AI agent drives this

Give an agent this README and the task folder, and hold it to these rules:

- **At the start:** scaffold the full folder, never a partial structure. Write `DECISION.md` before any code. Ask the user for the context, the options (include "do nothing"), and the trade-off that they accept. If the decision is truly trivial, one line that says so, with the reason, is enough. The file is never skipped.
- **During the work:** every deployment step goes into `Scripts/` with a paired undo in `Rollback/`. A script without a rollback is not done. Capture evidence the moment it exists, not retroactively. Record executed tests in `Testing/` with results, not intentions.
- **At close:** run the [Definition of Done checklist](../../templates/Definition-of-Done-Checklist.md) honestly. Never check a box that was not verified end to end. Report skipped steps plainly: "Testing/ is empty" is a finding, not a formatting problem. Do not fabricate artifacts to satisfy the structure. An honest gap is more useful than an invented document.

## The source of each artifact

| Artifact | Template | AI assist |
|---|---|---|
| Ticket itself | [Ticket-Template](../../templates/Ticket-Template.md) | [write-ticket](../../skills/write-ticket/SKILL.md) |
| DECISION.md | [ADR-Template](../../templates/ADR-Template.md) | An agent driving this README |
| PR | [PR-Template](../../templates/PR-Template.md) | [pull-request-creator](../../skills/pull-request-creator/SKILL.md) |
| Testing/ | [Test-Cases-Template](../../templates/Test-Cases-Template.md) | An agent driving this README |
| MONITORING.md | [Monitoring-Note-Template](../../templates/Monitoring-Note-Template.md) | An agent driving this README |
| IMPACT.md | [Impact-Summary-Template](../../templates/Impact-Summary-Template.md) | An agent driving this README |
| Post-mortem | [Post-Mortem-Template](../../templates/Post-Mortem-Template.md) | An agent driving this README |
| Runbook (per integration, not per fix) | [Runbook-Template](../../templates/Runbook-Template.md) | None |

## The principle

You do not lack artifact *types*. You already write design documents, decks, and test sheets. The gap to the tech-lead level has two parts:

- **Templated consistency.** Every ticket gets the same rigor, not only the hard tickets.
- **Loop closure.** Record the decisions. Measure the impact. Monitor the health after the deployment. Write a post-mortem after a failure.

A 10x engineer makes the whole team faster. Each folder here converts your personal knowledge into a team asset.
