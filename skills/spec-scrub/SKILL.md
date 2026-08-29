---
name: spec-scrub
description: Scrub a ticket, spec, or requirements document for ambiguity, contradictions, missing cases, and untestable claims before implementation starts. Use this skill before work begins on any non-trivial change.
---

A question asked now costs a conversation. The same question discovered mid-build costs a rewrite. Scrub the spec to surface the expensive questions early. Review the requirements only. Do not design the solution here.

## Pass 1: can each requirement be tested today?

For every requirement, ask: could I write the failing test right now? If the answer is no, the requirement is a wish. The usual offenders are adjectives ("fast", "intuitive", "robust", "handled gracefully"). Each one gets rewritten with a number or an observable behavior, or gets flagged.

## Pass 2: the blind-spot sweep

Check that each of these is either specified or explicitly out of scope:

- **Extremes:** empty, zero, first-run, and maximum states.
- **Failure:** a dependency down, a timeout, a partial success. What does the user see, what retries, what rolls back?
- **Repetition and concurrency:** the same request twice (idempotency), two actors at once.
- **Denial:** every role that must not be able to do this.
- **Data over time:** migration of existing rows, retention, deletion, audit.
- **The unstated -ilities:** volume, latency, accessibility, timezone and locale.

## Pass 3: contradictions

Find requirements that conflict with each other or with the system's current behavior (check the code where possible). Two requirements cannot both win. Ask which one does.

## Pass 4: claims without proof

Find statements presented as facts ("the ID is unique", "this always runs after the nightly job"). Each one is either verified against the code and data, or converted into a question. Unverified claims are where specs quietly import defects.

## Pass 5: hidden scope

Find the attractive adjacent work the spec never excludes, and the gold-plating hiding inside criteria. Name both so the team can cut them consciously.

## Output format

- **Blockers:** questions that must be answered before work starts, each phrased as a one-line either/or.
- **Risks:** items that allow work to proceed with a named danger.
- **Nits:** wording and testability fixes, each offered as a rewrite.
- **Verdict:** ready, ready after blockers, or needs a working session with the [Problem Brief](../../templates/Problem-Brief-Template.md).

Scale the scrub to the stakes. A two-line bug ticket gets passes 1, 2 (failure and repetition only), and 4. A cross-system feature gets all five.
