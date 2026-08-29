# Eval Harness: <feature or agent under test>

> An eval harness for an LLM feature. Subjective impressions do not detect regressions. A scored case set in CI does. Copy this layout into the project as `evals/`, and treat the harness as a deliverable of the feature.

## Layout

```
evals/
├── cases/
│   └── <case-name>/
│       ├── input.<ext>       # the exact input: a diff, a document, a prompt payload
│       └── labels.json       # the expected findings or outputs, hand-labeled
├── results/
│   ├── machine.json          # raw per-case scores from the last run
│   ├── final.json            # the aggregate report (schema below)
│   └── review-guide.md       # how a human spot-checks disagreements
└── run.<sh|py|csproj>        # one command runs every case
```

## Case selection

- Include <10–30> cases: the common path, the boundary cases, and at least <3> cases where the model previously failed.
- Every production failure becomes a case in the same week. The harness grows from real mistakes.
- Hand-label every case. Do not use model output as the label.

## Aggregate report schema (`final.json`)

| Field | Meaning |
|---|---|
| `run_date`, `model`, `prompt_version` | What was tested. Version the prompt, or the numbers mean nothing |
| `precision` / `recall` | Against the hand labels |
| `human_agreement` | Fraction of sampled outputs that a human rater accepted |
| `latency_p50_ms`, `latency_p95_ms` | Measured, not estimated |
| `tokens_per_case`, `cost_per_case_usd` | From the API usage fields, not from estimates |

## Rules

- Run the harness in CI on every prompt or model change. Compare against the last accepted baseline. A drop of more than <X points> blocks the merge.
- Change one variable per run: the prompt, or the model, or the parameters. Two changes give zero information.
- Record cost per run. An accuracy win that triples the cost is a decision, not an upgrade.
- Keep [promptfoo](https://www.promptfoo.dev/) in mind before you build a custom runner. Use custom code only when the tool does not fit.
