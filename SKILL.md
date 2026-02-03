---
name: gemini-project-flow
description: Generate ai_prompt.md from a project book markdown file using bundled system/prompt references, then build a full project into <project>/code. Use when the user asks to run the run_codex flow, create ai_prompt.md from a project book, or generate a full project from a markdown spec.
---

# Gemini Project Flow

Follow the original two-phase flow from run_codex.py, but execute it within Gemini CLI.

## Inputs

- Ask for the path to the project book markdown file if not provided.
- Default project directory name is the markdown filename stem; allow the user to override.
- Use the current working directory as the base dir.

## Phase 1: Build ai_prompt.md

1) Read the bundled references:
   - `references/system_prompt.md`
   - `references/prompt.md`
2) Combine them exactly in this order, with blank lines between sections:
   - system_prompt content (rstrip)
   - prompt content (rstrip)
   - The literal line:
     `Read the markdown file at this path and use it as input for the task:`
   - The absolute path to the markdown file
3) Write the result to `ai_prompt.md` in the current working directory.

## Phase 2: Generate the project

1) Create `<base_dir>/<project_dir>/code`.
2) Read `ai_prompt.md` and follow its instructions strictly to generate the full project code.
3) Write all generated files into the `code` directory only.
4) Do not ask follow-up questions unless the markdown spec is missing or ambiguous enough to block progress.

## Output Expectations

- `ai_prompt.md` exists at the base directory.
- The project code is fully generated under `<project_dir>/code`.
- If any file operations fail, report the exact error and stop.
