# Configs

Ready-to-copy configuration files. Each file encodes a rule that is easy to state and easy to forget. Copy the file into the target repo, then adjust the marked lines.

| File | Copy to | What it does |
|---|---|---|
| [agent-install-guard.json](agent-install-guard.json) | `<repo>/.claude/settings.json` | Makes Claude Code ask before every package install, and blocks pipe-to-shell commands. This enforces the [dependency-verification](../skills/dependency-verification/SKILL.md) rule at the harness level, not only in prose |
| [privacy-check.yml](privacy-check.yml) | `<repo>/.github/workflows/privacy-check.yml` | Fails CI when an employer-internal or private term appears in the repo, in file contents or in file names. The term list lives in a repo secret, so the check does not disclose the terms |
| [dotnet.gitignore](dotnet.gitignore) | `<repo>/.gitignore` | Baseline ignore rules for a .NET repo |
| [python.gitignore](python.gitignore) | `<repo>/.gitignore` | Baseline ignore rules for a Python repo |
| [node.gitignore](node.gitignore) | `<repo>/.gitignore` | Baseline ignore rules for a Node/frontend repo |
| [baseline.dockerignore](baseline.dockerignore) | `<repo>/.dockerignore` | Keeps secrets, git history, and local artifacts out of every image |

## How the install guard enforces its rules

The guard has two layers:

- The `ask` list uses Claude Code permission prefix rules. Every common install command (`npm install`, `pip install`, `brew install`, and the rest) triggers an approval prompt.
- The `PreToolUse` hook inspects each Bash command before it runs. If the command pipes anything into a shell (`curl … | sh`, `wget … | bash`), the hook blocks it with exit code 2 and tells the agent to download, read, then run. Permission rules match by prefix, so a hook is the reliable place to catch a pipe in the middle of a command.

The hook needs `jq` on the machine. Install it first, or the hook cannot parse the tool input.

## How the privacy check fails

- The term list is missing on a push or a same-repo PR: the job fails loudly. A scan that silently does not run is worse than no scan.
- The term list is missing on a fork PR (GitHub withholds secrets there): the job warns and passes, and the push after the merge runs the full scan.
- A term matches: the job fails and prints only file paths, never the matched text.

Rules:

- Add `.gitignore` and `.dockerignore` in the first commit, before the first secret can exist.
- If a settings file and a written rule disagree, the settings file wins. Keep both current.
