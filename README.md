# Project Guidelines

## Deletion Policy (Strict)
- NEVER delete or overwrite more than 5 files in a single turn without explicit confirmation.
- NEVER use `rm -rf` or destructive shell commands outside the `/tmp` directory. If you plan/need to delete, move to trash instead.
- IF you believe a file (or code, or anything else) is "dead/not needed," you MUST mark it for review in the Implementation Plan rather than deleting it.

## Implementation Plan Requirements
- Before editing code, you MUST generate an Implementation Plan Artifact that includes:
1. **Summary of Changes**: High-level goal.
2. **File Diff Preview**: List every file to be modified or created.
3. **Rollback Strategy**: How to undo these changes if they fail tests.
4. **Risk Level**: Mark the task as LOW, MEDIUM, or HIGH risk.

## Execution Guardrails
- ALWAYS pause for human approval if the "Risk Level" is MEDIUM or HIGH.
- DO NOT proceed with a plan if the local test suite fails.
- DO NOT access files outside the current workspace directory.

## 🛠 Operational Preferences
- **Conciseness:** Provide direct, actionable answers. Minimize conversational filler.
- **Verification:** Always run the relevant test or build command after making a change to verify success.
- **Atomic Commits:** Focus on one logical change at a time. If a task requires multiple steps, confirm after each step.
- **Context Management:** If the conversation history gets long or we switch to a new feature, proactively suggest a `/clear` after summarizing progress. After code changes make sure you verify and update any .md (readme, architecture, etc.) files.
- **Git commit messages:** Use Conventional Commits (https://www.conventionalcommits.org/en/v1.0.0/). Make sure the commit message is short and to the point, no long unneccessary explanations and buzzwords, keep it simple, human readable and understandable.
- Try to not do the hard work yourself (in the main agent), prefer to delegate tasks to multiple sub-agents to work in parallel. Main agent should aim to orchestrate (if possible) the work with sub-agents.

## 🧪 Testing & Quality
- **Test First:** If a bug is reported, try to create a reproduction test case before fixing it.
- **Linting:** Ensure all changes pass the project's linting rules before finishing a task.
- **Refactoring:** Do not refactor unrelated code unless explicitly asked. Stay focused on the current task.

## 📝 Communication
- **Planning:** For complex tasks (affecting >2 files), always provide a brief technical plan in "Plan Mode" before executing.
- **Errors:** If a command fails twice, stop and ask for clarification rather than trying a third time blindly.
- **Feedback:** If anything is unclear, stop and ask for clarification rather than trying to improvise the solution.

# Golang

## 💻 Coding Standards
- **Imports:** Group imports by: 1. Standard library, 2. External dependencies, 3. Local modules.
- **Maintainability:** Prioritize readability over "clever" one-liners. Prefer smaller functions, split big functions into smaller ones. Always verify if you can re-use some of the existing functions (or functionalities).
- **Error Handling:** Always include explicit error handling for async operations and I/O.
- **Naming**: Use MixedCaps (not snake_case). Acronyms should be consistent case (URL, HTTP, ID).
- **Interfaces**: Accept interfaces, return concrete types. Keep interfaces small.
- **Receivers**: Use pointer receivers for methods that modify state; value receivers for read-only.
- **Packages**: Avoid stuttering (e.g., `config.Config` not `config.ConfigStruct`)

---------------------------------------------------------------------------------------------------------------------------------------------