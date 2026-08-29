# The 10X Engineer Toolkit

A stack-agnostic toolkit for engineers who build with AI coding agents (Claude Code, Copilot, Cursor): **skills, prompts, templates, workflows, and tools** for the development process.

A 10x engineer is not a person who types faster. A 10x engineer puts the practices of great engineers into a system, so that every ticket, review, and deploy gets the same care automatically. This repo contains that system in a portable and shareable form, tuned for work where an AI agent does much of the typing.

## Provenance and scope

This is a personal project, built on personal time and personal equipment. It contains no code, documents, data, or names from any employer, past or present. Everything here restates public, industry-standard practice (sources linked where they exist) as I apply it to my own personal projects. It is not affiliated with, endorsed by, or derived from any company's internal tooling.

## Repo map

| Directory | Contents | When to use it |
|---|---|---|
| [skills/](skills/) | Claude Code skills: structured, reusable AI instructions for engineering tasks (planning, verification, tickets, reviews, migrations…) | You do a task many times, and you want the AI to do it your way each time |
| [agents/](agents/) | One AI agent definition: a read-only devil's advocate that challenges plans and "done" claims | You want a challenger with its own system prompt before you commit to an approach |
| [prompts/](prompts/) | Standalone copy-paste prompts for any AI assistant (commit messages, standups, outage updates, estimates…) | You need a quick, portable prompt with no tool setup |
| [templates/](templates/) | Document templates: PR, ticket, ADR, post-mortem, runbook, test cases, DoD checklist, AGENTS.md, build guide… | You must write a document that you wrote before, and you do not want an empty page |
| [workflows/](workflows/) | End-to-end repeatable processes: the **Task Lifecycle**, the data-first feature build, and a low-cost deploy runbook | You want the same process for every task, not only the important ones |
| [tools/](tools/) | Curated tools and software by domain (AI, API and data, frontend, cloud, security, debugging, productivity) | You want the best available tool for a job, not a bad one |
| [resources/](resources/) | Recommended books, sites, newsletters, and a list of hard-won landmines | You want to learn a domain, or you want to avoid a trap that already cost someone time |
| [configs/](configs/) | Ready-to-copy config files: an agent install guard, a privacy CI check, and .gitignore/.dockerignore baselines | You start a repo, and the guardrails belong in the first commit |
| [scripts/](scripts/) | Small scripts for repeated mechanical tasks: task scaffolding and a demo-GIF converter | You do the same manual sequence again, and it should be one command |

## Favorites

These items get the most day-to-day use. Start with them. Promote an item to this table when you reach for it weekly. Remove an item when you stop using it.

| Favorite | Type | Why it earns the spot |
|---|---|---|
| [FFmpeg](tools/productivity.md) + [gif-from-recording.sh](scripts/gif-from-recording.sh) | Tool + script | One command turns a demo recording into a README GIF. The GIFs make the documentation look finished |
| [Obsidian](tools/productivity.md) | Tool | The daily knowledge base: linked Markdown notes in plain files that you own |
| [Excalidraw](tools/productivity.md) | Tool | The fastest way to make an architecture sketch that you can share. The hand-drawn style invites feedback |
| [Bicep](tools/cloud-devops.md) + [infra starter](workflows/low-cost-deploy/infra/main.bicep) | Tool + template | Azure resources become reviewable code in the repo. The starter deploys a whole scale-to-zero API in one file |
| [Build Guide](templates/Build-Guide-Template.md) | Template | The phase plan for every side project. Each phase is weekend-sized and has an exit test, so projects finish instead of stall |
| [Low-Cost Deploy](workflows/low-cost-deploy/) | Workflow | The deploy runbook for every side project: static UI on a CDN, API in a scale-to-zero container. Idle cost stays near zero, and the demo stays live for years |
| [Data-First Feature Build](workflows/data-first-feature-build/) | Workflow | The build order for every AI-agent feature: schema first, then backend, then frontend. The schema grounds each later layer |

## Quick starts

**"I start a task with a coding agent"**
→ [skills/plan-first/](skills/plan-first/SKILL.md) for the plan before the first edit, and [skills/write-ticket/](skills/write-ticket/SKILL.md) if the task itself is still vague.

**"I need to open a PR"**
→ [skills/pull-request-creator/](skills/pull-request-creator/SKILL.md) writes the title and description from the diff and opens the PR, or grab the raw [PR prompt](prompts/pull-request.md) and [template](templates/PR-Template.md).

**"The agent says it is done"**
→ [skills/verification-loop/](skills/verification-loop/SKILL.md) for the evidence standard, and [agents/devils-advocate.md](agents/devils-advocate.md) when the conclusion feels too comfortable.

**"My agent forgets the project rules"**
→ [skills/agents-md/](skills/agents-md/SKILL.md) plus the [Agents-md template](templates/Agents-md-Template.md). One context file, kept current.

**"Long sessions go off the rails"**
→ [skills/context-hygiene/](skills/context-hygiene/SKILL.md): what to load, when to reset, and how to spot context rot.

**"I am new to this codebase"**
→ [skills/system-mapping/](skills/system-mapping/SKILL.md), in orientation mode for day one and knowledge-base mode for the long term.

**"Before I merge or install anything"**
→ [skills/spec-scrub/](skills/spec-scrub/SKILL.md) before the work, [skills/threat-check/](skills/threat-check/SKILL.md) before the release, [skills/dependency-verification/](skills/dependency-verification/SKILL.md) plus the [install guard](configs/agent-install-guard.json) before every package.

**"I want the same care for every ticket"**
→ [workflows/task-lifecycle/](workflows/task-lifecycle/). Copy the `Task-Template/` folder for each ticket. Close it against the [Definition of Done checklist](templates/Definition-of-Done-Checklist.md).

**"I build a feature with an AI agent"**
→ [workflows/data-first-feature-build/](workflows/data-first-feature-build/). Give the agent the schema as code first. Then build Data layer → Backend layer → Frontend layer.

**"I start a new personal or demo project"**
→ [Agents-md template](templates/Agents-md-Template.md) for the context file, [Build Guide](templates/Build-Guide-Template.md) for the phase plan, [Cost Guardrails](templates/Cost-Guardrails-Checklist.md) before the first cloud resource, then [workflows/low-cost-deploy/](workflows/low-cost-deploy/) to ship it.

**"My AI-drafted text sounds like AI"**
→ [skills/avoid-ai-writing/](skills/avoid-ai-writing/SKILL.md) for posts, docs, commits, and PR prose.

## How the parts work together

```
                    ┌─────────────────────────────┐
                    │         WORKFLOWS           │  the repeatable process
                    │  (task lifecycle, …)        │
                    └──────────┬──────────────────┘
                               │ uses
        ┌──────────────┬───────┴──────┬───────────────┐
        ▼              ▼              ▼               ▼
   TEMPLATES      SKILLS/PROMPTS    AGENTS          TOOLS
   the documents  AI instructions   AI helpers      software that
   that you make  that make them    with a stance   removes all
   each time      the same way      of their own    manual work
```

- **Templates** define the standard for each document.
- **Skills and prompts** teach an AI to produce those documents to your standard. They also cover planning, verification, reviews, and troubleshooting.
- **Agents** add a perspective that you can delegate to, like the devil's advocate.
- **Tools** do all the work that does not need a human or an AI.
- **Workflows** put all of these items in a sequence, so that you do not skip a step.

## How to use the AI files

The [skills/](skills/) and [agents/](agents/) directories use the [Claude Code](https://claude.com/claude-code) format. But the content is plain Markdown. You can use the content with any capable AI assistant.

**With Claude Code (recommended, one command):** this repo is a plugin marketplace. Add it one time:

```
/plugin marketplace add vondraysanford/The10XEngineerToolkit
/plugin install 10x-toolkit@10x-engineer-toolkit
```

Every skill and agent is then available in every project, and updates arrive when this repo changes. Invoke a skill with `/10x-toolkit:plan-first`, `/10x-toolkit:verification-loop`, or an equivalent command. Claude can also apply skills automatically. Agents run through the Task/Agent tool, or they run when Claude delegates work to them.

**Manual copy (no plugin):**

```bash
# Make skills available in a project (or symlink to share across projects)
cp -r skills/* your-project/.claude/skills/

# Make agents available
cp agents/*.md your-project/.claude/agents/
```

**With a different AI assistant:** open the `SKILL.md` file or the agent file. Paste the body into your assistant as instructions.

> Note for maintainers: after you fork or publish this repo, set the `PRIVATE_TERMS` repository secret so that the [privacy check](.github/workflows/privacy-check.yml) can run. The check fails loudly without it.

## The principle

Most engineers do most of these tasks, but not always. They do the tasks on their best tickets, and when they have time. These four points are the difference:

1. **Consistent templates.** Every ticket gets the same care, not only the difficult ones.
2. **Complete follow-up.** Record each decision. Measure the impact. Monitor system health after the release. If the system fails, write a post-mortem.
3. **Recorded judgment.** Keep your standards in files (skills, templates, checklists), not only in your memory. Then the AI and your teammates can apply the standards without you.
4. **Verified output.** An agent's "done" is a claim. Require the evidence, every time.

A 10x engineer makes the full team faster. Each item in this repo converts personal knowledge into a shared asset.

## Contributing

Additions are welcome. Add one tool or resource for each PR row. Include a one-line "why it is useful" note. See [CONTRIBUTING.md](CONTRIBUTING.md) for the entry formats and the content boundary rules.

## License

[MIT](LICENSE)
