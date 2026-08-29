---
name: dependency-verification
description: Verify a package before you install, add, or upgrade it. Use this skill for every dependency change, including NuGet, npm, pip/uv, Homebrew, Docker base images, and GitHub Actions.
---

Name-squatting is a real attack, not a theoretical one. A look-alike package name that differs from the official ID by only a prefix or one character can carry malware, and AI assistants hallucinate plausible package IDs. Treat every install as a security decision.

## Before every install

Do not run an install command silently. Present this block first, and wait for approval:

- **Package ID:** the exact ID, character for character
- **Version:** the exact pinned version
- **Registry:** nuget.org, npmjs.com, PyPI, or other
- **Source:** the official repo or documentation page that names this exact ID

## Verify the identity

1. Find the package ID in the project's own documentation or repository. Do not trust search results, tutorials, or memory. Name-squats rank well in search, and models repeat them.
2. On the registry page, check the owner, the download count, the linked repository, and the publish history. A young package with few downloads and a familiar name is a red flag.
3. Compare the ID character for character against the official source. Check for added prefixes, swapped letters, and plural forms.

## Pin everything

- Pin exact versions. Do not use floating ranges. One unpinned install of a new major version can break a build days later, with no diff that explains it.
- Commit the lockfile (`packages.lock.json`, `package-lock.json`, `uv.lock`, `requirements.txt` with `==`).
- Pin GitHub Actions to a full commit SHA, not a tag. Tags can move.
- Pin Docker base images to a digest when the build must be reproducible.

## Watch for

- **Install scripts.** npm `postinstall` and Python `setup.py` run code at install time. Review them for packages that you do not already trust.
- **New transitive dependencies.** After an add, diff the lockfile. A small package that pulls 40 new dependencies deserves a second look.
- **End of life.** Check [endoflife.date](https://endoflife.date/) before you adopt a framework or runtime version.

## After a mistake

- If a wrong or suspicious package was installed: remove it, clear the package caches, diff the lockfile, and check what ran.
- If a secret passed through terminal output, a log, or a transcript during the incident: rotate it. Do not estimate the odds first.

## Customize this

- Add your company's internal registry and its rules.
- Add packages that your team pre-approves, so that the check is fast for them.
