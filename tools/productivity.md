# Productivity Tools

These tools are a meta-layer. They help you capture, search, launch, diagram, and share quickly.

## Terminal

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Free | Recursive search that respects .gitignore | The largest single improvement to CLI work. Your AI tools also use it internally |
| [fzf](https://github.com/junegunn/fzf) | Free | Fuzzy search for anything: files, history, branches | `Ctrl+R` with fzf makes your full shell history immediately reusable |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Free | A `cd` command that learns your habits (`z proj` jumps to the correct directory) | It removes the many `cd ../..` commands that you type each day |
| [Oh My Posh](https://ohmyposh.dev/) / [Starship](https://starship.rs/) | Free | An informative cross-shell prompt (git status, versions, cloud context) | It shows your branch and context at all times. This prevents wrong-environment mistakes |
| [tldr](https://tldr.sh/) | Free | Community-maintained man pages that start with examples | `tldr tar` gives you the correct command in 5 seconds |

## Launchers & OS

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Raycast](https://www.raycast.com/) (macOS) | Freemium | A launcher: apps, clipboard history, snippets, scripts, window management | It replaces five utilities. Extensions turn common tasks into keystrokes |
| [PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/) (Windows) | Free | The Run launcher, FancyZones, Text Extractor (OCR), and a color picker | Microsoft's official set of features that Windows does not include |
| [Everything](https://www.voidtools.com/) (Windows) | Free | Instant filename search of every drive | It finds files reliably, in milliseconds. Windows Search often does not |
| Clipboard history (Raycast / `Win+V` / [Ditto](https://ditto-cp.sourceforge.io/)) | Free | A multi-item clipboard | You do not copy the same items again. This saves more minutes per day than most tools on this page |
| [espanso](https://espanso.org/) | Free | A cross-platform text expander | Type `:standup` to insert your template. It also inserts standard responses, IDs, and email text |

## Notes, diagrams, screenshots

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Obsidian](https://obsidian.md/) | Free | Local-first linked Markdown notes | Your personal knowledge base in plain files that you own. The files are searchable, versionable, and portable |
| [Excalidraw](https://excalidraw.com/) | Free | Quick diagrams with a hand-drawn style | The informal style invites feedback. It is the fastest way to make an architecture sketch that you can share |
| [Mermaid](https://mermaid.js.org/) | Free | Diagrams as text in Markdown (renders on GitHub) | Diagrams stay in the repo and change through PRs. They do not become obsolete in a wiki |
| [draw.io / diagrams.net](https://www.drawio.com/) | Free | Full-featured diagram software that saves to your files | Use it for the formal architecture diagram on a wiki page |
| [ShareX](https://getsharex.com/) (Windows) / [CleanShot X](https://cleanshot.com/) (macOS) | Free / Paid | Screenshot capture, annotation, screen recording, and OCR | An annotated screenshot improves every ticket and PR. These tools make the capture fast |
| [FFmpeg](https://ffmpeg.org/) | Free | Command-line conversion of video and audio. One command turns a screen recording into a GIF | A short demo GIF in a README shows the feature faster than text. It makes your documentation look finished |

## The principle

Each friction that you remove adds up. If you save 10 seconds on a task that you do 50 times a day, you save an hour a week. Automate the capture (screenshots, snippets, clipboard). Automate the recall (search, history, launcher). Then your attention stays on the real problem.
