---
name: context-hygiene
description: Keep an AI coding session's context small, current, and correct. Use this skill when a session grows long, when the agent starts to repeat or contradict itself, or when planning how to split large work across sessions.
---

An agent's output quality tracks the quality of its context, not the size of it. Old file versions, dead plans, and unrelated chatter in the window all compete with the facts that matter. Manage the window like a workspace, not like a log.

## Load only what the task needs

- Start from the task, not from the repo. Open the files that the change touches and their direct callers. Do not preload the whole project "for background".
- Prefer a targeted search over a broad read. One grep that finds the three call sites beats reading ten files that might contain them.
- Delegate exploration to a subagent where the tool supports it. The subagent burns its own context on the search and returns only the conclusion. The main session stays small.

## One task, one session

- Start a fresh session per task. A session that fixed a bug, then discussed architecture, then started a feature carries three contexts, and each one dilutes the others.
- Persist state in files, not in chat. Write plans, findings, and decisions to a scratch file or the task folder. A file survives the session, is reviewable, and can seed the next session. Chat memory does none of this.

## Recognize context rot

Watch for these symptoms in a long session:

- The agent re-reads files it already read, or asks questions it already answered.
- The agent edits against an old version of a file after the file changed.
- Answers get more generic while the task gets more specific.
- The agent contradicts a decision made earlier in the same session.

When you see them, do not push through. Reset: clear the session, restate the task in three sentences, and reload only the current files. Ten minutes of restating beats an hour of degraded output.

## Restate at the boundaries

Before a long or risky stretch of work, restate the plan and the constraints in one message. A restatement refreshes the facts that matter and pushes the stale ones out of weight. Do the same after any interruption or large diff.

## Customize this

- Add your tool's specific commands for clearing or compacting a session.
- Add the project's context file (`AGENTS.md`, `CLAUDE.md`) to the standard reload list, and see the [agents-md](../agents-md/SKILL.md) skill for what belongs inside it.
