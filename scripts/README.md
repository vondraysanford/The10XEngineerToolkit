# Scripts

Small scripts for the tasks that engineers rewrite in every project. Each script is a working template: run it as-is where possible, and adjust the `CUSTOMIZE` blocks where marked.

| Script | What it does |
|---|---|
| [new-task.sh](new-task.sh) | Scaffolds a task folder from the [Task-Template](../workflows/task-lifecycle/Task-Template/). One command replaces the copy-and-rename steps |
| [gif-from-recording.sh](gif-from-recording.sh) | Converts a screen recording into a palette-clean GIF for a README. Arguments: `<input-video> [output.gif]`, with `FPS` and `WIDTH` overrides. One command replaces the two-pass ffmpeg incantation |

Rules:

- Every script starts with `set -euo pipefail`. A script that continues after an error hides the error.
- Run `bash -n <script>` after each edit. It catches syntax errors before runtime.
- A script that a new machine cannot run without undocumented setup is not done. State the requirements at the top of the file.
