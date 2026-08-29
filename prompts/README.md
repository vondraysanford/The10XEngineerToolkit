# Prompts

These are standalone prompts. Copy and paste them into an AI assistant. They need no tools and no setup. Each file is one prompt. Each prompt has a `<<<input>>>` marker that shows where your content goes.

For the large workflows (PR and ticket writing, reviews, system mapping), use the [skills/](../skills/) versions. Those versions have more judgment, and they read your repo. The prompts in this folder are the quick versions and the everyday extras.

| Prompt | Purpose |
|---|---|
| [commit-message.md](commit-message.md) | Commit messages from a diff |
| [pull-request.md](pull-request.md) | A PR title and description from a diff and a ticket |
| [standup-update.md](standup-update.md) | A clear standup update from raw notes |
| [outage-update.md](outage-update.md) | Status updates to stakeholders during an outage |
| [estimation-breakdown.md](estimation-breakdown.md) | A breakdown of a feature into tasks that you can estimate, with risks |
| [bug-report.md](bug-report.md) | A bug report with clear actions, from a vague problem description |
| [tech-debt-proposal.md](tech-debt-proposal.md) | A business case to reduce tech debt |

## Tips for these prompts

- Paste real artifacts (diffs, logs, notes). Specific input gives specific output.
- Match the model to the prompt. Use the strongest model for [estimation-breakdown.md](estimation-breakdown.md) and [tech-debt-proposal.md](tech-debt-proposal.md), because they weigh trade-offs. A small fast model is enough for the rest, because they format facts that you supply.
- Tell the assistant what the reader knows. For example, "audience is non-technical leadership" changes the full output.
- Keep your best outputs. A proven prompt with a proven example is better than one of them alone.
