---
name: readme-generator
description: >
  Generate a GitHub-ready README.md.
  Use this skill whenever the user asks to create, write, or generate a README,
  README.md, or project documentation.
---

# README Generator for Python Projects (uv-based)

Generate a polished, GitHub-ready README.md from source code.

## Workflow

1. **Scan the project** — Read the project root to identify:
   - `pyproject.toml` (project name, description, Python version, dependencies)
   - Source files in `src/` or top-level package directories
   - Existing README.md (if any, to understand current state)

2. **Extract key facts** — From `pyproject.toml` and source code, determine:
   - Project name
   - One-liner description
   - Python version constraint
   - Key dependencies
   - How to run the project (`uv run <command>`)

3. **Generate README.md** — Follow the template below exactly.

4. **Write the file** — Save as `README.md` in the project root.

## README Template

The output must follow this structure. Do not add extra sections.
Use English. Keep it concise.

````markdown
<!-- Badges -->
- <img src="https://img.shields.io/badge/-MIT-blue.svg?style=flat">
- <img src="https://img.shields.io/badge/-Python-3776AB.svg?logo=python&logoColor=white&style=flat">
- <img src="https://img.shields.io/badge/-Markdown-000000.svg?logo=markdown&logoColor=white&style=flat">
- <img src="https://img.shields.io/badge/-Ubuntu-6F52B5.svg?logo=ubuntu&style=flat">
- <img src="https://img.shields.io/badge/-Vim-019733.svg?logo=vim&style=flat">

# {Project Name}

{2–3 sentence description.}

## Prerequisites

- Python {version} or later
- uv (Python package manager)

## Installation

```bash
git clone https://github.com/R-Tatara/{repo-name}.git
cd {repo-name}
uv sync
```

## Usage

```bash
uv run python {script}.py
```

{expected output, key options}

## LICENSE

MIT
````

## Writing Rules

- English only
- Polite but concise — no filler
- Do NOT explain implementation details
- Use bullet points liberally
- The README alone must be sufficient to clone and run the project
- Select only the badges that are relevant to the project from the badge set above
  (e.g., omit badge if not relevant, add others if appropriate)
- If the project has additional useful info (environment variables, configuration,
  Docker), add a minimal section — but only if truly needed for first-run success
- Repo name is "https://github.com/R-Tatara/repo-name.git"