# CLAUDE.md

## Workflow: Research → Plan → Annotate → Implement

Every non-trivial task follows this pipeline. Do not skip phases.

### Phase 1: Research

- Read the relevant parts of the codebase deeply before proposing anything.
- Write findings to `research.md` in the project root — never just summarize verbally.
- Understand existing patterns, conventions, caching layers, ORM usage, and public interfaces before suggesting changes.
- Surface-level reading is not acceptable. Read implementations, not just signatures.

### Phase 2: Plan

- Write a detailed implementation plan to `plan.md` with code snippets, file paths, trade-offs, and considerations.
- Do NOT use built-in plan mode. Use the markdown file as shared mutable state.
- End the plan with a granular todo list broken into phases and individual tasks.
- **Do not implement yet.** Wait for review and approval.

### Phase 3: Annotate (Human-in-the-Loop)

- After writing the plan, stop and wait. The user will review and add inline notes to `plan.md`.
- When told "I added notes," address every note and update the document accordingly.
- This cycle may repeat 1–6 times. Do not implement until explicitly told to.
- The phrase "don't implement yet" means exactly what it says.

### Phase 4: Implement

When told to implement:

- Execute the entire plan. Do not cherry-pick or stop mid-flow for confirmation.
- Mark each task/phase as completed in `plan.md` as you go.
- Do not stop until all tasks and phases are completed.
- Run typecheck (or equivalent) continuously — catch problems early, not at the end.
- Do not add unnecessary comments or jsdocs.
- Do not use `any` or `unknown` types in TypeScript.

### Phase 5: Feedback During Implementation

- Expect terse corrections during implementation. The plan provides full context, so short directives are sufficient.
- When something goes in a wrong direction, expect a revert and re-scope rather than incremental patching.
- Reference existing code when pointed to it — match the style, structure, and patterns of the referenced file.

## Autonomous Bug Fixing (Scoped)

For **isolated, mechanically obvious** fixes only:

- Typos, off-by-one errors, missing null checks, failing tests with a clear cause.
- Point at logs, errors, failing tests — then resolve them.
- No context switching required from the user for these cases.

For anything that touches architecture, crosses module boundaries, or involves judgment calls: follow the full Research → Plan → Annotate → Implement pipeline. When in doubt, write a plan.

## Verification Before Done

- Never mark a task complete without proving it works.
- Diff behavior between main and your changes when relevant.
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness.

## Core Principles

- **Simplicity First:** Make every change as simple as possible. Impact minimal code. If simplicity and elegance conflict, simplicity wins.
- **No Laziness:** Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact:** Changes should only touch what's necessary. Avoid introducing bugs. Protect existing interfaces unless explicitly told to change them.
- **No Scope Creep:** If something isn't in the plan, don't add it. Nice-to-haves get cut unless the user says otherwise.

## Subagent Strategy (Research Phase Only)

- Subagents are useful for parallelizable research: reading multiple folders, exploring options, running analysis.
- For planning and implementation, prefer a single long session to preserve accumulated context.
- One task per subagent for focused execution.

## Lessons File (Optional, Pruned)

- If `tasks/lessons.md` exists, review it at session start.
- After a correction from the user, add a concise pattern to `tasks/lessons.md` only if it represents a recurring mistake.
- Prune aggressively. Remove one-off corrections. Keep only genuine, repeated patterns.
- If the file exceeds 30 items, it needs pruning before adding more.
