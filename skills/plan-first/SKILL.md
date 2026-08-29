---
name: plan-first
description: Require a written plan before code changes start. Use this skill at the start of any multi-file or non-trivial change, when the user asks for a plan, or when an agent is about to edit code without one.
---

Do not edit code before a plan exists in writing. An agent that starts typing immediately optimizes for the first file it sees, not for the change. The plan is cheap. The rework is not.

## What the plan must contain

1. **The goal, restated.** One or two sentences in your own words. If you cannot restate the goal, you do not understand it yet. Ask now.
2. **The files you expect to touch.** List each file with one line on the change. A reviewer must see the blast radius before the blast.
3. **Acceptance checks.** State how you will prove the change works: the command, the test, or the observable behavior. Write these before the code, so the code serves the check and not the reverse.
4. **Unknowns and risks.** Name what you have not verified yet. An unknown stated up front is a question. An unknown discovered later is a bug.

## Size the plan to the context

- If the plan touches more than about 5 files or 2 subsystems, split it into stages. Present the first stage only. A plan that exceeds the working context degrades into improvisation halfway through.
- Order the stages so that each one is verifiable on its own. Put the riskiest or most uncertain stage first, while attention is highest.

## The execution contract

- Follow the plan. If reality contradicts the plan (a missing API, a wrong assumption), stop and say so before you improvise. A one-line note ("the plan assumed X, but the code does Y, so I propose Z") keeps the human in the decision.
- Do not silently grow the scope. New work that the plan does not name goes into a note or a new ticket, not into the diff.
- When the work is done, walk the plan's acceptance checks one by one and show the evidence for each.

## When to skip this

A single-file, single-purpose fix with an obvious test does not need a written plan. State that in one line and proceed. Everything else does.

## Customize this

- Add your team's plan format or design-review template if one exists.
- Add the file-count or subsystem threshold that your team uses for "needs a design review, not just a plan".
