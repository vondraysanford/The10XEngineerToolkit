# Landmines

Hard-won gotchas. Each entry cost real time or money once. The format is fixed: the trap, the cost, the rule. Add an entry in the same week that a trap bites you, while the details are exact. Delete an entry when the upstream product fixes it.

## AI coding agents

| The trap | The cost | The rule |
|---|---|---|
| An effort mode that does not match the task. Too much effort overthinks a small task. Too little effort under-plans a hard one | Tasks that run far longer than needed. At worst, the agent repeats the same approval request in an endless loop | Set the effort to match the task before you start ([tools/ai.md](../tools/ai.md)). If the agent asks for the same approval twice, stop it and correct the effort |

## .NET

| The trap | The cost | The rule |
|---|---|---|
| A `TargetFramework` that does not match an installed SDK can still build, then fail at launch | A "fix" that breaks the run | Never change a TargetFramework to satisfy tooling. Match the project to the SDKs that the machine has |
| Major-version API rewrites (for example, an OpenAPI/Swagger library that renamed namespaces across a major version) are newer than an AI assistant's training data | Generated code that targets the old API, in every file | When a library crossed a major version recently, paste the current API surface or migration guide into the AI context before generation |
| An unpinned `dotnet add package` pulls the newest version | A breaking upgrade that arrives silently | Pin exact versions, always. See [dependency-verification](../skills/dependency-verification/SKILL.md) |

## Azure and AI services

| The trap | The cost | The rule |
|---|---|---|
| Portal wizards default to paid tiers. An AI search service can default to a ~$245/month standard tier when free and basic tiers exist | A surprise monthly bill | Check the SKU of every wizard-created resource before you confirm. Complete the [Cost Guardrails checklist](../templates/Cost-Guardrails-Checklist.md) first |
| An AI-platform SDK client can require the bare service base URL, while the portal hands you a longer project-scoped URL | Auth and routing errors with misleading messages | Read the client's constructor docs for the exact URL form. Do not paste the first URL that the portal shows |
| Reasoning models spend "thinking" tokens from the output-token budget | Responses cut off at a cap that looks generous | Set max output tokens with headroom (for example 3000 where 1000 seems enough), and test with the real model |
| Search-index writes are near-real-time, not immediate | Tests that fail only sometimes | Poll for the indexed document before you assert on it. Never `sleep` a fixed guess |

## macOS development

| The trap | The cost | The rule |
|---|---|---|
| AirPlay listens on port 5000 and answers 403 | A health check that "passes" against the wrong service | Do not use port 5000. Use `curl -f`, which fails on a 403, in every readiness check |
| Docker Desktop does not always put `docker` on PATH | Scripts that work in one terminal and fail in another | Use the full path `/Applications/Docker.app/Contents/Resources/bin/docker`, or repair PATH at the top of the script |
| nvm-installed Node is absent in non-interactive shells | CI-like scripts that cannot find `npm` locally | `source ~/.nvm/nvm.sh` at the top of any script that runs npm |

## Machine learning

| The trap | The cost | The rule |
|---|---|---|
| A row-level train/test split on grouped or time-series data leaks the future into training | Accuracy numbers that collapse in production | Split by unit (engine, user, session) or by time, never by row |
| Model artifacts pulled from a registry at container start | Slow cold starts, and a runtime dependency on the registry | Bake the model into the image at CI build time |

## Supply chain

| The trap | The cost | The rule |
|---|---|---|
| Look-alike package names, one prefix or one character away from the official ID | Potential malware with full local access | Verify the exact ID against the project's own docs before every install. See [dependency-verification](../skills/dependency-verification/SKILL.md) |
