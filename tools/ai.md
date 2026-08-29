# AI Engineering Tools

This file has two categories: tools that make *you* faster, and tools that help you *build* AI features.

## AI-assisted development

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Claude Code](https://claude.com/claude-code) | Paid | An agent that writes code in your terminal or IDE. It reads the repo, edits files, runs tests, and uses your skills and agents | The skills and agents in this repo connect directly to it. Your standards become its standards |
| [GitHub Copilot](https://github.com/features/copilot) | Paid | Inline code completion and chat in the IDE | It completes boilerplate code quickly. It is the minimum level of AI help, not the maximum |
| [Cursor](https://cursor.com/) | Freemium | A VS Code fork with built-in AI | If you want AI built deeply into the editor itself, evaluate this tool |
| [Hermes Agent](https://hermes-agent.nousresearch.com/) | Freemium | An open-source AI agent from Nous Research. It has persistent memory, and it runs in the CLI and in chat apps (Slack, Telegram, Discord) | Delegate routine work from the chat app that you already have open: scheduled reports, web research, and recurring tasks. The memory keeps your context between sessions |
| [UI Skills](https://www.ui-skills.com/) | Free | A public catalog of design-engineering skills (accessibility, motion, frontend craft, interface quality) that install into Claude Code, Cursor, and other agents | AI-generated UI is often generic. These skills give the agent the judgment of a design engineer |
| [Figma Make](https://www.figma.com/make/) | Freemium | Turns a prompt, an image, or a Figma design into a working UI prototype with editable code | A prototype that people can click gets better feedback than a static mockup. Test the UI before you build the feature |

**The tool is not the real multiplier. The context that you give the tool is the real multiplier.** An AI with your [skills](../skills/), [templates](../templates/), and a good `AGENTS.md`/`CLAUDE.md` produces work that matches your team. An AI without them produces generic Stack Overflow answers. Invest time in the context files. Start from the [Agents-md template](../templates/Agents-md-Template.md) and the [agents-md](../skills/agents-md/SKILL.md) skill, and enforce the install rule with the [install guard](../configs/agent-install-guard.json).

## Run models locally

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Ollama](https://ollama.com/) | Free | A local LLM runner with one-command setup and an API | Use it for prototypes with sensitive data, offline work, and experiments at zero cost |
| [LM Studio](https://lmstudio.ai/) | Free | A GUI to download and chat with local models | It is an easy start with local models for teammates who do not use a CLI |

## Build AI features

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Anthropic API / Claude Agent SDK](https://docs.claude.com/) | Paid (usage) | Models plus the agent harness that powers Claude Code, packaged as an SDK | Build agents on infrastructure that already solves tool-use loops, context management, and permissions |
| [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) | Free (spec) | An open standard that connects AI assistants to tools and data | Write one server for your internal API or database. Then every MCP-capable assistant can use it |
| [promptfoo](https://www.promptfoo.dev/) | Free/Paid | Evaluation and red-team tests for prompts, RAG, and agents, written as code | Prompts regress without warning. Evals in CI find the regression before users do |

## Practices

- Match the model tier to the task. Plan with the strongest model. Implement with a mid-tier model. Document with a small model. See the [data-first feature build](../workflows/data-first-feature-build/README.md) for the full sequence.
- Match the effort mode to the task in the same way. Use high effort for plans, reviews, and hard debugging. Use low effort for mechanical edits. A wrong effort mode makes the task slow. At worst, it traps the agent in an endless approval loop (see [landmines](../resources/landmines.md)).
- Treat prompts and skills as code. Version them, review them, and test them (see [skills/](../skills/)).
- Keep a personal library of proven prompts (see [prompts/](../prompts/)). To write the same good prompt again is wasted work.
- If a feature is user-facing, measure it with evals. Do not rely on subjective impressions.
