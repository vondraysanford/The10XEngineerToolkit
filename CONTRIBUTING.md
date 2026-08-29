# Contributing

The standard for inclusion is this test: **you would install, read, or use the item again on the first day of a new job.** If the item passes the test, add it. If the item is only interesting, do not add it. Curation gives this repo its value. A list of 200 tools is a search problem. A list of 15 tools is a recommendation.

## Writing style

All prose in this repo follows ASD-STE100 Simplified Technical English: short sentences, active voice, one instruction per sentence, and no idioms or marketing words. See [CLAUDE.md](CLAUDE.md) for the rules. Match the style of the existing files before you open a PR.

## Keep the content generic

This repo is public. Every item must restate public, industry-standard practice. Before you open a PR:

- Do not include employer-internal names, system names, team names, client names, or personal data.
- Do not include content that only makes sense inside one company. Put company-specific detail in a "Customize this" section as a placeholder instead.
- Check file names as well as file contents. CI runs a privacy scan ([.github/workflows/privacy-check.yml](.github/workflows/privacy-check.yml)) that checks both.

## How to add a tool

Add a row to the applicable file in [tools/](tools/):

```markdown
| [Tool Name](https://link) | Free/Paid/Freemium | One line: what it does | One line: why it is useful |
```

Rules:

- Link to the official site, not to a blog post about the tool.
- Make sure that the "Why it is useful" text describes the work that the tool saves, not the features. Bad: "searches code." Good: "finds all uses of a symbol in 2 seconds, not in a 20-minute manual search."
- If the tool is not cross-platform, give the platform (for example, **Windows**, **macOS**).
- If the tool replaces an entry in the list, state this, and remove the old entry.

## How to add a resource

Use the same procedure in [resources/](resources/) for sites, books, blogs, and newsletters. Include the type of engineer that gets the most benefit from the resource.

## How to add a skill

Create `skills/<kebab-name>/SKILL.md` with this frontmatter:

```markdown
---
name: skill-name
description: One line that says when to use this skill. Write it so that an AI can decide relevance.
---

Instructions body…
```

Guidelines:

- Write the instructions for an AI that does the task. Do not write documentation for a human reader.
- Record judgment, not only steps. Describe the properties of good output, the common failure modes, and the items to refuse or flag.
- Put team-specific details (server names, conventions) in a clearly marked "Customize this" section. Then other users can adapt the skill.

## How to add a template

Make each template in [templates/](templates/) ready to complete. Include real section headings, `<angle-bracket placeholders>`, and inline hints in blockquotes. The author deletes the hints when the author completes the template. A template that you must study before use is documentation, not a template.

## How to add an agent

Agent files in [agents/](agents/) use the Claude Code subagent frontmatter: `name`, `description`, `model`, and the optional `tools`. The system prompt follows the frontmatter. Make sure that the description tells the orchestrator model when to delegate work to this agent. The `model` field selects the tier that the agent runs on.

## How to add a config or script

- A config in [configs/](configs/) must be ready to copy: state the target path and the marked lines to adjust in the [configs/README.md](configs/README.md) table.
- A script in [scripts/](scripts/) must start with `set -euo pipefail`, state its requirements at the top, and pass `bash -n`. Mark project-specific blocks with `CUSTOMIZE`.
- Each addition encodes one rule that is easy to forget. If the file does not enforce or automate a rule, it belongs in [templates/](templates/) or in prose instead.
