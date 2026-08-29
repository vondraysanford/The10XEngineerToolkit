# Pull Request

For the repo-aware version that reads your diff itself and can open the PR, use the [pull-request-creator](../skills/pull-request-creator/SKILL.md) skill. This is the quick copy-paste version.

```text
Write a pull request title and description for this branch.

Rules:
- Title: imperative mood, a maximum of 70 characters, states what changed
  and where. If the log that I paste shows a convention (ticket prefix,
  conventional commits), follow it.
- Structure: why (the problem, then the approach, 2 to 4 sentences) /
  what changed, grouped by behavior, not by file / how to verify, with
  exact commands and expected results / risk and rollback, with an
  explicit "none" for DB and config changes when there are none.
- Call out anything a reviewer would not expect in the diff: renames,
  moved files, config changes, generated code.
- Describe only what is in the diff. If the diff mixes unrelated changes,
  say so and propose how to split it. Do not write one description for
  the mixed diff.

Ticket or issue (the "why" lives here):
<<<paste the ticket text or link summary>>>

Recent log for convention reference:
<<<paste `git log --oneline -10`>>>

Diff:
<<<paste `git diff <base>...HEAD`>>>
```
