# Scripts/

This folder holds each deployment step as a runnable script: SQL migrations, config changes, and `az` commands. Number the scripts in execution order (`01-…`, `02-…`). If you did a step by hand in a portal or an SSMS window, the step is not complete. Script that step. Each script here must have a paired undo script in `../Rollback/`.
