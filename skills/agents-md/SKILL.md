---
name: agents-md
description: Write or improve a project context file for AI coding tools (AGENTS.md, CLAUDE.md, or copilot-instructions.md). Use this skill when a project has no context file, when the agent keeps repeating the same mistake, or when the user asks what belongs in one.
---

A context file is the project's standing instructions to every AI tool that works in the repo. The [AGENTS.md](https://agents.md/) standard, `CLAUDE.md`, and `.github/copilot-instructions.md` are file-name variants of the same idea. Write one file. Symlink or copy it to the names your tools read.

## What belongs in the file

Only facts that change what the agent does, and that the agent cannot discover from the code:

1. **Settled decisions.** Choices that are made, with a one-line reason each. This stops the agent from proposing a rewrite of a decision the team already closed.
2. **Hard machine and environment constraints.** Installed runtime versions, PATH quirks, ports that are taken, commands that must run first. These are the facts an agent will otherwise "fix" into a broken state.
3. **Landmines.** Traps that already cost time in this project, one line each: the trap, then the rule that avoids it.
4. **Working agreements.** The behaviors you require every session: plan before multi-file edits, verify packages before install, report measured results only, never commit secrets.
5. **The commands.** Build, test, and run, exactly as they work on this machine. Test each one before you write it down.

## What does not belong

- Tutorials, style guides, or API documentation. The agent can read the code and the linter config.
- Aspirations ("we value clean code"). A rule with no test is a mood.
- Anything the repo already enforces mechanically. Do not duplicate the linter into prose.
- Company-internal names or data, if the repo is public or shared.

## Rules for the file itself

- Keep it under about 150 lines. The file loads into every session. Every line you add pushes something else out of the agent's attention.
- Add a rule the same day it is earned. When a trap bites, write the landmine entry while the details are exact.
- Delete rules that stop being true. A stale constraint causes the same damage as a missing one.
- One file per repo. A second, conflicting context file is worse than none.

## Method

1. Start from the [Agents-md template](../../templates/Agents-md-Template.md).
2. Fill the environment section from the actual machine, not from memory. Run the commands to confirm them.
3. Ask the user for the top three mistakes their AI tools repeat in this repo. Write each one as a landmine or an agreement.
4. Review the file monthly, or whenever the agent makes a mistake the file should have prevented. That mistake is the next line.
