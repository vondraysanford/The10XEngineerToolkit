# Workflows

This folder contains repeatable end-to-end processes. A workflow connects [templates](../templates/), [skills](../skills/), and [tools](../tools/) so that no step depends on human memory.

| Workflow | What it covers |
|---|---|
| [task-lifecycle/](task-lifecycle/) | Any ticket, from pickup to closure: ticket → shipped → verified → documented → monitored. This is the most important workflow. Consistent use gives the largest benefit |
| [data-first-feature-build/](data-first-feature-build/) | Features built with AI agents: Data layer → Backend layer → Frontend layer, so the schema grounds every later layer |
| [low-cost-deploy/](low-cost-deploy/) | Personal and demo projects: a static UI plus a scale-to-zero container API, with cost guardrails and demo hardening |

## Candidates to add

- **New-repo orientation:** a day-one map of an unfamiliar codebase. The [skills/system-mapping](../skills/system-mapping/SKILL.md) skill does most of the work.
- **Dependency upgrade cadence:** weekly small-batch updates with a verification checklist. The [skills/dependency-verification](../skills/dependency-verification/SKILL.md) skill covers the per-package check.
