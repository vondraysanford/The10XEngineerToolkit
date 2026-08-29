# CLAUDE.md

This repo is a curated system of tools, skills, prompts, templates, and workflows. It contains no application code. Every deliverable is a Markdown document, a config file, or a small script. The value of the repo is curation and consistency. Protect both.

## Writing style: Simplified Technical English

All prose in this repo follows ASD-STE100 Simplified Technical English. This is a hard requirement, not a preference. Text that does not follow it will not match the rest of the repo.

- Write short sentences. Use a maximum of about 20 words for an instruction and about 25 words for a description.
- Use the active voice. Use the imperative for instructions ("Run the script", not "The script should be run").
- Give one instruction per sentence.
- Use simple connectors: "Make sure that", "Do not", "Then", "If X, do Y".
- Do not use an em dash inside a sentence. Use a period, a comma, or a colon.
- Do not use idioms, marketing words, or filler ("leverage", "robust", "seamless", "it's worth noting").

Before you commit prose, compare it with [README.md](README.md) and one file in [tools/](tools/). The new text must read the same way.

## Structure rules

- A skill is one folder: `skills/<kebab-name>/SKILL.md` with `name` and `description` frontmatter. See [CONTRIBUTING.md](CONTRIBUTING.md) for the full format.
- An agent is one file in `agents/` with Claude Code subagent frontmatter.
- A template is ready to complete: real headings, `<angle-bracket placeholders>`, and hints in `>` blockquotes that the author deletes.
- Tool and resource entries are table rows with a "why it is useful" line that names the work saved.
- When you add a skill, add a row to the catalog in [skills/README.md](skills/README.md). Do the same for templates, workflows, and prompts in their folder READMEs. When an addition changes how a person uses the repo, update the repo map or the quick starts in [README.md](README.md).

## Curation test

Add an item only if the user would install, read, or use it again on the first day of a new job. An interesting item is not a qualified item. Prefer to improve an existing entry over adding a near-duplicate.

## Content boundary

This repo is public, and it must stay generic. Every item restates public, industry-standard practice. Do not add employer-internal names, system names, team names, client names, or personal data. Do not add content that only makes sense inside one company. Before any commit, scan the tree, including file names, for private terms. CI runs the same scan ([.github/workflows/privacy-check.yml](.github/workflows/privacy-check.yml)) against a term list stored in a repository secret.

## Plugin packaging

The repo is a Claude Code plugin marketplace. [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json) points at the repo root as one plugin, and [.claude-plugin/plugin.json](.claude-plugin/plugin.json) names it `10x-toolkit`. Claude Code discovers `skills/` and `agents/` automatically. Do not move or rename those directories. Do not put content directories inside `.claude-plugin/`.

## Verify before you commit

- Make sure that every relative link resolves. CI runs a full link check ([.github/workflows/link-check.yml](.github/workflows/link-check.yml)).
- Run `bash -n scripts/*.sh` after you edit a script.
- Validate JSON files with `python3 -m json.tool <file>` after you edit them.
- Do not commit secrets, employer-internal names, or personal data. The repo is public.
