# Commit Message

For the repo-aware version that reads your diff and log itself, use the [pull-request-creator](../skills/pull-request-creator/SKILL.md) skill. This is the quick copy-paste version.

```text
Write a commit message for this diff.

Format:
- Subject: use the imperative mood, a maximum of 50 characters, and no period
  at the end. If the recent log that I paste shows a convention (conventional
  commits, a ticket prefix), follow that convention.
- Body: write a body only if the change is not self-evident. Write 1 to 3
  sentences about WHY the change exists. Give the problem or the intent. Do
  not restate the diff. Wrap lines at 72 characters.
- Do not describe changes that are not in the diff. If the diff mixes
  unrelated changes, say so. Then propose how to split the diff. Do not write
  one message for the mixed diff.

Recent log for convention reference:
<<<paste `git log --oneline -10`>>>

Diff:
<<<paste `git diff --staged`>>>
```
