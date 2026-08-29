---
name: pull-request-creator
description: Create a pull request from the actual branch diff, meaning the title, the description, and the command that opens it. Use this skill when the user asks to write, improve, or open a PR, or asks to describe a change.
---

A pull request has one source of truth: the diff. Never describe a change from memory of the conversation. Memory includes the approaches that were abandoned. The diff does not.

## Gather the evidence

1. Read the branch diff against its base (`git diff <base>...HEAD`) and the branch history (`git log <base>..HEAD --oneline`).
2. Read the recent mainline history (`git log --oneline -15`) to learn the repo's conventions: ticket prefixes, conventional-commit types, sentence style. Follow what you find.
3. Read the ticket or issue if one exists. The "why" lives there, not in the code.
4. If the repo has its own PR template, fill that one. Otherwise use the kit's [PR template](../../templates/PR-Template.md).

## The description

- **Title.** Imperative mood, about 70 characters, states what changed and where, and follows any convention the log shows.
- **Why first.** Two to four sentences: the problem, then the approach. A reviewer must understand the purpose without opening the ticket.
- **What changed, grouped by behavior.** Not a file list. GitHub already shows the files. Name the areas of behavior that moved, and call out anything a reviewer would not expect: a rename, a moved file, a config change, regenerated code.
- **How to verify.** Exact commands, URLs, and expected results. If the tests are the verification, name the specific test that demonstrates the behavior.
- **Risk and rollback.** One line of risk assessment with its reason, the rollback method, and an explicit "none" for database or config changes when there are none. Silence is not "none".

## The commits behind the PR

- Check the branch history before you open the PR. Commit subjects use the imperative mood, about 50 characters, per Chris Beams' ["How to Write a Git Commit Message"](https://cbea.ms/git-commit/). The quick copy-paste version lives in [prompts/commit-message.md](../../prompts/commit-message.md).
- If the history is a pile of "wip" and "fix" commits, propose a cleanup (squash or reword) before the PR opens. Ask before you rewrite any history.

## Create it

- Open the PR with the CLI, so the title and body land exactly as written: `gh pr create --title "…" --body "…"` (or `--body-file` for a long description). Confirm the base branch explicitly. A PR against the wrong base wastes a review cycle.
- Use `--draft` when verification is incomplete or feedback is the goal. Say which one it is in the description.
- Show the user the final title and body, and wait for approval before you run the create command. Opening a PR is a public act in the repo.

## What to refuse

- A diff that mixes unrelated concerns gets a split proposal, not a description that glues the concerns together with prose.
- Leftover debug code, secrets, or changes the author cannot explain get flagged to the user before any description is written. The description's job is accuracy, not marketing.
- A diff too large to review honestly gets that feedback first. A good description does not repair an unreviewable PR.
