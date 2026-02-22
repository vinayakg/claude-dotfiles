# Claude Code Power User Toolkit

A ready-to-use collection of **19 skills**, **8 commands**, and **12 agents** that supercharge Claude Code with specialized capabilities for code review, document creation, architecture design, and more.

---

## Table of Contents

1. [Getting Started](#getting-started)
   - [Step 1: Install Claude Code on MacOS](#step-1-install-claude-code-on-macos)
   - [Step 2: Set Up Your Claude Account](#step-2-set-up-your-claude-account)
   - [Step 3: Install This Toolkit](#step-3-install-this-toolkit)
2. [What's Included](#whats-included)
3. [Top 5 Skills](#top-5-skills)
4. [Top 5 Commands](#top-5-commands)
5. [Top 5 Agents](#top-5-agents)
6. [Complete Reference](#complete-reference)

---

## Getting Started

### Step 1: Install Claude Code on MacOS

Claude Code is a command-line tool that brings Claude's AI capabilities directly to your terminal.

**Option A: Install via Homebrew (Recommended)**

```bash
brew install claude-code
```

**Option B: Install via npm**

```bash
npm install -g @anthropic-ai/claude-code
```

**Verify Installation:**

```bash
claude --version
```

You should see output like: `claude-code v2.x.x`

---

### Step 2: Set Up Your Claude Account

**2.1 Create an Anthropic Account**

1. Visit [console.anthropic.com](https://console.anthropic.com)
2. Click **Sign Up**
3. Enter your email and create a password
4. Verify your email address

**2.2 Get API Access**

1. Log into [console.anthropic.com](https://console.anthropic.com)
2. Navigate to **API Keys** in the left sidebar
3. Click **Create Key**
4. Copy your API key (starts with `sk-ant-...`)

> **Important:** Keep your API key private. Never share it or commit it to version control.

**2.3 Configure Claude Code**

Open your terminal and run:

```bash
claude
```

When prompted, paste your API key.

**Verify Setup:**

```bash
claude "Hello, what model are you?"
```

You should receive a response from Claude confirming the connection works.

---

### Step 3: Install This Toolkit

This toolkit adds custom skills, commands, and agents to your Claude Code installation.

**3.1 Clone This Repository**

```bash
git clone https://github.com/vinayakg/claude-dotfiles.git
cd claude-dotfiles
```

**3.2 Copy Components to Claude's Configuration Folder**

```bash
# Create the Claude config directory if it doesn't exist
mkdir -p ~/.claude

# Copy all components
cp -r commands ~/.claude/
cp -r agents ~/.claude/
cp -r skills ~/.claude/
cp -r plugins ~/.claude/
cp settings.json ~/.claude/
```

**3.3 Verify Installation**

Open a new Claude Code session:

```bash
claude
```

Then type:

```
/tools
```

You should see your custom commands, agents, and skills listed.

**Quick Validation Checklist:**

| Check | Command | Expected Result |
|-------|---------|-----------------|
| Commands installed | `/commit` | Shows commit helper |
| Skills available | Type "create a PDF" | Uses pdf skill |
| Agents working | Ask "review this code" | Uses code-reviewer agent |

---

## What's Included

| Category | Count | Purpose |
|----------|-------|---------|
| **Skills** | 19 | Specialized capabilities (PDF creation, presentations, design) |
| **Commands** | 8 | Quick actions via `/command-name` |
| **Agents** | 12 | AI specialists for specific tasks |
| **Plugins** | 43 | Extended functionality from marketplaces |

---

## Top 5 Skills

Skills give Claude specialized knowledge and capabilities. They activate automatically when relevant.

### 1. PDF Toolkit (`pdf`)

**What it does:** Create, edit, merge, split, and extract data from PDF files.

**Example uses:**
- "Create a PDF report from this data"
- "Extract all tables from this PDF"
- "Merge these 3 PDFs into one"

---

### 2. Word Documents (`docx`)

**What it does:** Create and edit Word documents with formatting, tracked changes, and comments.

**Example uses:**
- "Create a Word document for this proposal"
- "Add tracked changes to this contract"
- "Extract text from this Word file"

---

### 3. PowerPoint Presentations (`pptx`)

**What it does:** Create and edit presentations with layouts, speaker notes, and comments.

**Example uses:**
- "Create a 10-slide presentation on Q4 results"
- "Add speaker notes to this presentation"
- "Convert these slides to images"

---

### 4. Excel Spreadsheets (`xlsx`)

**What it does:** Create spreadsheets with formulas, charts, and data analysis.

**Example uses:**
- "Create a budget spreadsheet with formulas"
- "Build a financial model from this data"
- "Add charts to this Excel file"

---

### 5. Frontend Design (`frontend-design`)

**What it does:** Create distinctive, professional web interfaces and visual designs.

**Example uses:**
- "Design a landing page for our product"
- "Create a dashboard interface"
- "Build a responsive web component"

---

## Top 5 Commands

Commands are quick actions you invoke by typing `/command-name`.

### 1. `/commit` - Smart Git Commits

**What it does:** Creates well-formatted git commits with emoji prefixes and conventional commit format.

**How to use:**
```
/commit
```

**Example output:**
```
✨ feat: add user authentication module
```

---

### 2. `/review` - Code Review

**What it does:** Provides structured feedback on code changes against a base branch.

**How to use:**
```
/review main
```

**Feedback includes:**
- 🔧 Changes needed
- ♻️ Refactoring suggestions
- 👍 Positive highlights
- ❓ Questions

---

### 3. `/explain` - Code Explanations

**What it does:** Provides clear explanations of code, concepts, or system behavior.

**How to use:**
```
/explain this function
/explain --level basic how authentication works
```

---

### 4. `/five-whys` - Root Cause Analysis

**What it does:** Uses the "Five Whys" technique to find the root cause of problems.

**How to use:**
```
/five-whys why did the deployment fail
```

---

### 5. `/reflect` - Session Analysis

**What it does:** Creates a summary of what was accomplished in your current session.

**How to use:**
```
/reflect
```

Saves a reflection document to `.claude/reflections/`.

---

## Top 5 Agents

Agents are specialized AI assistants for specific types of tasks. Claude automatically delegates work to them.

### 1. Code Reviewer (`code-reviewer-hb`)

**What it does:** Performs systematic code reviews with structured feedback.

**Triggers when you say:**
- "Review this code"
- "Check my changes before I commit"
- "What's wrong with this implementation?"

---

### 2. Backend Architect (`backend-architect-hb`)

**What it does:** Designs reliable backend systems with focus on security, performance, and data integrity.

**Triggers when you say:**
- "Design an API for user management"
- "How should I structure this backend service?"
- "Review my database schema"

---

### 3. System Architect (`system-architect-hb`)

**What it does:** Designs scalable system architecture with long-term maintainability in mind.

**Triggers when you say:**
- "Design the architecture for this application"
- "How should these services communicate?"
- "Plan the system components"

---

### 4. Root Cause Analyst (`root-cause-analyst-hb`)

**What it does:** Investigates complex problems through systematic hypothesis testing.

**Triggers when you say:**
- "Why does this keep failing?"
- "Debug this intermittent issue"
- "Find the root cause of this bug"

---

### 5. Requirements Agent (`requirements-agent-hb`)

**What it does:** Transforms feature ideas into structured requirements with user stories.

**Triggers when you say:**
- "Write requirements for this feature"
- "Create user stories for the login system"
- "Document what this feature should do"

---

## Complete Reference

### All Skills (19)

| Skill | Description |
|-------|-------------|
| `pdf` | PDF creation, editing, merging, extraction |
| `docx` | Word document creation and editing |
| `pptx` | PowerPoint presentation creation |
| `xlsx` | Excel spreadsheet with formulas and charts |
| `frontend-design` | Professional web interface design |
| `algorithmic-art` | Generative art using p5.js |
| `canvas-design` | Visual art and poster creation |
| `brand-guidelines` | Anthropic brand styling |
| `theme-factory` | 10 professional themes for documents |
| `doc-coauthoring` | Collaborative documentation workflow |
| `web-artifacts-builder` | Multi-component HTML artifacts |
| `skill-creator` | Create new skills |
| `mcp-builder` | Create MCP servers |
| `slack-gif-creator` | Animated GIFs for Slack |
| `webapp-testing` | Web app testing with Playwright |
| `oss-security-auditor` | Open source security audits |
| `structured-plan-mode-hb` | Complex feature planning |
| `internal-comms` | Internal communication templates |

### All Commands (8)

| Command | Description |
|---------|-------------|
| `/commit` | Smart git commits with emojis |
| `/review` | Code review with structured feedback |
| `/explain` | Clear code explanations |
| `/five-whys` | Root cause analysis |
| `/reflect` | Session reflection summary |
| `/save-prompt` | Save reusable prompts |
| `/prompt-generator` | Generate effective prompts |
| `/tools` | List all available tools |

### All Agents (12)

| Agent | Description |
|-------|-------------|
| `code-reviewer-hb` | Systematic code review |
| `refactoring-expert-hb` | Code quality improvement |
| `backend-architect-hb` | Backend system design |
| `system-architect-hb` | Scalable architecture design |
| `tech-design-agent-hb` | Technical design documents |
| `codebase-analyzer-hb` | Code implementation analysis |
| `root-cause-analyst-hb` | Problem investigation |
| `deep-research-agent-hb` | Comprehensive research |
| `requirements-agent-hb` | Requirements documentation |
| `pair-programmer-hb` | Collaborative problem-solving |
| `git-diff-analyzer-hb` | Git branch comparison |
| `oss-security-auditor` | Security audits |

# Disabling Agents and Skills

## Agents

Agents are disabled by renaming files with `.disabled` extension.

**Example**: `backend-architect-hb.md` → `backend-architect-hb.md.disabled`

To re-enable: Remove the `.disabled` extension.

## Skills

Skills are toggled in `settings.json` by setting values to `true` (enabled) or `false` (disabled).

**Example**:
```json
"python-patterns/SKILL.md.disabled": false

---

## Keeping Updated

To sync the latest changes from your `~/.claude/` folder to this repository:

```bash
./backup-claude-script.sh
```

---

## Troubleshooting

**Commands not showing up?**
- Restart Claude Code
- Check that files are in `~/.claude/commands/`

**Skills not activating?**
- Verify the skill folder has a `SKILL.md` file
- Check that skills are in `~/.claude/skills/`

**Need help?**
- In Claude Code, type `/help`
- Report issues at [github.com/anthropics/claude-code/issues](https://github.com/anthropics/claude-code/issues)

---

## License

MIT License - Feel free to use and modify for your own Claude Code setup.
