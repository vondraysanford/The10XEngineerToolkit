---
name: incremental-migration
description: Migrate or upgrade a legacy system in shippable increments, covering framework upgrades, dependency updates, and architecture moves. Use when planning or executing work on an old codebase where a big-bang rewrite is tempting.
---

The unit of migration is the increment that ships. The system must work at every commit, and every step must be reversible. A rewrite that goes dark for six months is not a migration. It is a second system with a deadline problem.

## Take inventory before touching anything

1. Compare every runtime and framework version against [endoflife.date](https://endoflife.date/). Past-EOL items are the clock-driven part of the backlog.
2. Audit dependencies for versions that are old, abandoned, or vulnerable.
3. Measure test coverage on the paths the migration will cross. Thin coverage there is the first work item, not a footnote.
4. Assess the deploy pipeline. The distance between "it compiles" and "we can safely ship twice a day" is the real size of the modernization.

Also name the motive: end-of-life pressure, velocity pain, or a platform requirement. The motive picks the path. Do not let interesting unrelated cleanup pick it instead.

## Pin the current behavior first

Where coverage is thin, write characterization tests before changing anything: tests that record what the system does today, including its bugs. Document the bugs rather than silently fixing them mid-migration, because a behavior change hidden inside a migration diff is undiagnosable later. This technique, and the broader discipline of cutting seams into legacy code, comes from Michael Feathers' *Working Effectively with Legacy Code*. For nearly-pure logic, golden-master tests (recorded input/output pairs) are the cheapest pin available.

## Choose the smallest method that works

In order of preference:

1. **In-place increments** for version and dependency work: one major version per hop, one risky dependency per PR, regression run between hops, breaking-changes notes read before, not after.
2. **Strangler fig** for architecture change, as described by Martin Fowler: introduce a seam (proxy, facade, interface), move one capability at a time behind it, keep the old path as fallback until metrics clear the new one, then delete the old path. The deletion is part of the scope. A strangler that never finishes leaves two systems forever.
3. **Parallel run** for correctness-critical logic (billing, calculation engines): run old and new side by side on real traffic, compare outputs, and cut over on evidence.
4. **Rewrite** only when the platform is genuinely dead and the scope is small enough to finish before the new code becomes the next legacy. Be honest about the second condition.

## Rules that keep it shippable

- A migration PR changes versions or structure, never behavior. Behavior changes get their own tickets. A mixed PR cannot be reviewed and cannot be bisected.
- Every increment carries its own rollback: the previous versions stay pinned, the old path stays routable.
- Sequence by risk times value: security EOL first, then the dependency that unblocks the others, then the velocity wins. Publish the sequence as tickets. A migration living in one long branch does not ship.
- Report outcomes in numbers: versions retired, CVEs closed, build minutes saved, deploy frequency. The numbers keep the effort funded.

## Where AI agents fit

Mechanical sweeps are ideal agent work: an API rename across 200 files, an obsolete pattern replaced everywhere. Define the transform precisely, let the agent apply it, review the diff, run the suite. Keep the judgment human: where the seams go, what to strangle, and when the parallel run has proven enough.
