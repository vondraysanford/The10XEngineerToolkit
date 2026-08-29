# Rollback/

This folder holds the paired undo script for each script in `../Scripts/`, with the same names (`01-…` undoes `01-…`). Write each undo script *before* the deployment. Check each undo script against a non-prod environment. If you cannot roll back a step (a destructive migration), that step is a **point of no return**. State it in the ticket and plan for it.
