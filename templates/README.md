# Templates

These templates are documents with blank fields. Replace the `<placeholders>`. Delete the `>` hint blockquotes. Then the document is ready. The templates follow one pattern: each task produces the same documents, each time.

| Template | When to use it |
|---|---|
| [PR-Template.md](PR-Template.md) | Each pull request (you can also use it as `.github/PULL_REQUEST_TEMPLATE.md`) |
| [Ticket-Template.md](Ticket-Template.md) | Tasks, stories, and tickets that a person with no context can start |
| [ADR-Template.md](ADR-Template.md) | Each design or approach decision that is not trivial, *before* you write the code |
| [Problem-Brief-Template.md](Problem-Brief-Template.md) | Tickets that are large or not clear. Agree on the problem before you write code |
| [Test-Cases-Template.md](Test-Cases-Template.md) | The standard test-case layout (you can copy it into a spreadsheet or your tracker) |
| [Monitoring-Note-Template.md](Monitoring-Note-Template.md) | After each production change. It tells you what to watch and for how long |
| [Impact-Summary-Template.md](Impact-Summary-Template.md) | Measure the results when you close the work. The numbers go into your review document |
| [Post-Mortem-Template.md](Post-Mortem-Template.md) | Production incidents and defects. It is blameless, and it produces action items |
| [Runbook-Template.md](Runbook-Template.md) | One runbook for each integration or system, not one for each fix |
| [Definition-of-Done-Checklist.md](Definition-of-Done-Checklist.md) | Each task. Complete the checklist from top to bottom before you close the item |
| [Agents-md-Template.md](Agents-md-Template.md) | The context file for an AI assistant in each project: settled decisions, machine constraints, landmines, working agreements |
| [Build-Guide-Template.md](Build-Guide-Template.md) | Side and portfolio projects: weekend-sized phases, each with an exit test |
| [Eval-Harness-Template.md](Eval-Harness-Template.md) | Each LLM feature: a scored case set with cost and latency, run in CI |
| [Cost-Guardrails-Checklist.md](Cost-Guardrails-Checklist.md) | Before the first cloud resource of a personal or demo project |

AI help: the [pull-request-creator](../skills/pull-request-creator/SKILL.md) and [write-ticket](../skills/write-ticket/SKILL.md) skills fill the PR and ticket templates from your diff or notes. The [task-lifecycle workflow](../workflows/task-lifecycle/) drives the ADR, test cases, monitoring note, impact summary, and post-mortem through the full lifecycle.
