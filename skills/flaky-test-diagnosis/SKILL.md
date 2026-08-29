---
name: flaky-test-diagnosis
description: Diagnose tests that fail intermittently, fail only in CI, or fail without a code change. Classify the failure, find the root cause, and prove the fix. Use whenever a test failure is not obviously explained by the current change.
---

A test that sometimes fails is telling the truth about something. The job is to find out about what. A rerun that happens to pass proves nothing, and deleting or skipping the test converts a signal into a blind spot.

## First: classify, do not debug yet

Read the complete failure output, then decide which of four cases this is:

1. **The code is wrong.** The test did its job. Fix the code.
2. **The test is stale.** The behavior changed on purpose and the test asserts the old behavior. Update the test to assert the *intended* behavior from the ticket, never to assert whatever the code currently outputs. A test updated to match output converts bugs into baselines.
3. **The test is flaky.** It passes and fails with no code change. Continue below.
4. **The environment is broken.** Compile errors, missing config, a dependency that is down. Repair the environment first, and draw no conclusions about the code until a known-good test passes in it.

## Flaky causes, in order of likelihood

- **Shared state.** The test passes alone but fails in the suite, or the reverse. Suspect statics, singletons, shared database rows, and order dependence between tests.
- **The clock.** Tests that read the real system time break near midnight, at month end, across timezones, or when a hardcoded date expires. The durable fix is an injected or fake clock.
- **Races.** A sleep used as synchronization, unawaited asynchronous work, or callbacks racing the assertions. The durable fix is to wait for the observable condition itself, with a timeout, never for a fixed duration.
- **Ordering assumptions.** Assertions on the order of an unordered query result or hash-based collection, or parallel test runs colliding on a shared resource.
- **Hidden external dependencies.** Real network, disk, or database calls inside a "unit" test, or leftovers from a previous failed run.
- **CI resource limits.** Timeouts tuned on a fast laptop, port collisions, memory ceilings.

## Method

- Make the failure cheap to reproduce before analyzing it: run the single test in a loop, N times, alone and then within the suite. Alone-passes-suite-fails already convicts shared state.
- Change one variable at a time, and keep a written note of what each run ruled out. An investigation without notes repeats itself.
- The fix must explain the observed pattern. "Increased the timeout" with no explanation is a bet, and the flake returns to collect it.
- Prove the fix the same way you reproduced the failure: loop the test, minimum 10 clean runs for a former flake, and record the root cause in the PR for the next person.

## Quarantine, the last resort

When a flake cannot be fixed now, skip it with a linked ticket and a reason in the skip annotation, and schedule the fix within the iteration. A skip without a ticket is a deleted test wearing a disguise.
