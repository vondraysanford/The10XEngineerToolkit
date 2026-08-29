# AGENTS.md

> This template is the context file for AI coding tools in one project. The [AGENTS.md](https://agents.md/) standard, `CLAUDE.md`, and `.github/copilot-instructions.md` are file-name variants of the same file. Write it once, then copy or symlink it to the names your tools read. Replace the `<placeholders>`. Delete the hints. Keep the file current: when a rule is earned the hard way, add it the same day. The [agents-md](../skills/agents-md/SKILL.md) skill explains what belongs here and what does not.

## What this is

<One paragraph: what this project does, and for whom. Name the stack.>

## Why it exists

<One or two sentences: the goal that makes trade-offs decidable. "Portfolio project that must stay under $X/month" decides differently than "internal tool for 500 users".>

## Decisions already made (do not relitigate)

> List the decisions that are settled, with a short reason for each. This stops the assistant from proposing a rewrite of a choice that you already made.

- <Decision, and the reason in one line>
- <Decision, and the reason in one line>

## Build plan

> Phases with checkboxes. The checkboxes are an honesty contract: never check a box unless the item works end to end. When an item lands, update the checkbox here and in the README in the same change.

- [ ] Phase 0: <setup and walking skeleton>
- [ ] Phase 1: <…>
- [ ] Phase 2: <…>

## Environment (hard constraints, do not "fix" these)

> The machine facts that an assistant will otherwise "repair" into a broken state. Examples from a real macOS setup, replace with yours:

- <Installed SDK versions. For example: only one runtime major version is installed. Never change a target framework or engine version to satisfy tooling.>
- <PATH quirks. For example: the Docker CLI is at /Applications/Docker.app/Contents/Resources/bin/docker.>
- <Shell setup. For example: run `source ~/.nvm/nvm.sh` before any npm command.>
- <Port constraints. For example: AirPlay owns port 5000 and answers 403. Use 5050/5100/8000, and use `curl -f` in health checks.>
- Never hardcode URLs, endpoints, or model names. Everything network-related comes from config.

## Known landmines

> The traps that already cost time or money in this project. One line each: the trap, and the rule that avoids it.

- <Trap → rule>

## Working agreements

- **Downloads and installs:** verify every package before install. Present the exact ID, the pinned version, the registry, and the source URL, and wait for approval. Pin exact versions. (See the [dependency-verification](../skills/dependency-verification/SKILL.md) skill.)
- **Plan first:** for any multi-file change, present a plan and wait for approval. (See the [plan-first](../skills/plan-first/SKILL.md) skill.)
- **Verify in the terminal:** after a change, build and run it, and hit the endpoint. Report what occurred, not what should occur. (See the [verification-loop](../skills/verification-loop/SKILL.md) skill.)
- **Numbers:** report measured numbers only. Never present an estimate as a measurement.
- **Secrets:** never commit or log a secret. If a key passes through output or a transcript, rotate it.
- **Scope:** edit existing files over creating new ones. No new projects or top-level folders without asking.
- **Writing:** <link your writing rules, for example the [avoid-ai-writing](../skills/avoid-ai-writing/SKILL.md) skill>

## Repo structure

<A short tree of the directories that matter, with one line each.>

## Common commands

```bash
<build command>
<test command>
<run command>
```
