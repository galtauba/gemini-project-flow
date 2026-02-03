# 🧠 Gemini Project Flow

End-to-end AI software project generation workflow for **Gemini CLI**.

Gemini Project Flow is a skill that automates the full pipeline of generating a software project from a markdown project specification.

---

## ✨ What This Skill Does

This skill implements a **two-phase automated software generation flow**:

### Phase 1 — Prompt Generation
- Reads a project book / specification markdown file
- Combines internal system + prompt references
- Generates:
  - `ai_prompt.md`

### Phase 2 — Full Project Code Generation
- Uses `ai_prompt.md`
- Generates full working software project code
- Writes output into:

```

<project>/code

````

---

## 🚀 Installation

Run inside the directory where you want the skill installed.

### One-Line Install

```bash
bash <(curl -s https://raw.githubusercontent.com/galtauba/gemini-project-flow/main/install.sh)
````

---

## 📁 Installed Files

After installation:

```
.gemini/
└ skills/
  └ gemini-project-flow/
     ├ SKILL.md
     └ references/
        ├ prompt.md
        └ system_prompt.md
```

---

## 🌳 Repository Structure

```
.
├ install.sh
├ SKILL.md
└ references/
   ├ prompt.md
   └ system_prompt.md
```

---

## 🧪 Usage Inside Gemini CLI

---

### 🚀 Basic Usage

```
Use gemini-project-flow to generate a project from a markdown project book.
```

---

### 📘 Example — Generate Project From Spec

```
Run gemini-project-flow.

Project book path:
./project_spec.md
```

---

### 📦 Example — Custom Project Directory

```
Run gemini-project-flow.

Project book path:
./docs/app_spec.md

Project directory name:
my-generated-app
```

---

### 🧠 Example — Natural Language

```
Use gemini-project-flow skill.

Input project book:
./docs/system_spec.md

Generate the full project.
```

---

### 🔬 Example — Full Flow Explicit

```
Run gemini-project-flow.

Generate ai_prompt.md from:
./project.md

Then generate full project code.
```

---

## 📦 Expected Output

```
ai_prompt.md

project-name/
└ code/
   ├ source files
   ├ configuration
   ├ dependencies
   └ README
```

---

## ❗ Requirements

* Gemini CLI installed
* curl installed

---

## 🔄 Updating

Re-run installer:

```
bash install.sh
```

---

## 🧹 Uninstall

```
rm -rf .gemini/skills/gemini-project-flow
```

---

## 🎯 Intended Use Cases

* Full project generation from markdown specs
* AI software generation pipelines
* Rapid prototyping
* Software architecture teaching
* Automated scaffolding

---

## 🧠 How It Works (High Level)

```
Project Markdown
        ↓
Generate ai_prompt.md
        ↓
AI Executes Prompt
        ↓
Full Project Code Generated
```

---

## 📜 License

MIT (or your license)

---

## 👤 Author

Gal Tauba


