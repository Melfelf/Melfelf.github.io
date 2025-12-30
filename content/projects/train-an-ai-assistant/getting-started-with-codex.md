+++
title = "Getting Started: Training an AI Assistant with Codex"
date = 2025-12-30T11:22:40+00:00
updated = 2025-12-30T11:22:40+00:00
reading_time = 7
description = "A practical first sprint to launch an AI assistant using Codex as the bootstrap model."
keywords = ["AI assistant", "Codex", "prompt engineering", "evaluation", "training data"]
+++

Training an AI assistant starts with clear intent and a rapid prototype. Codex is an excellent entry point because it can translate intent into structure—drafting prompts, scaffolding tools, and generating synthetic examples—so you can focus on defining quality.

## Define the north star

Begin by writing a one-paragraph charter that captures the assistant's audience, tone, and boundaries. Anchor every decision to this charter and keep it visible in your workspace. For this project, the assistant should be **practical, concise, and transparent about limitations**.

## Capture seed workflows

List 5–10 high-value tasks the assistant should excel at. For each task, collect:

- **Inputs**: real user questions, context snippets, or configuration files
- **Desired outputs**: an ideal answer with reasoning, references, and any safety constraints
- **Failure modes**: what a bad answer looks like (hallucinations, missing steps, unsafe guidance)

These examples become the first evaluation set. Even a small set is enough to guide Codex toward your expectations.

## Use Codex to draft the baseline prompt

Start with a system prompt that encodes the charter, tone, and formatting. Ask Codex to propose a structured prompt and then refine it manually. A simple template:

```
You are <assistant-name>, a concise AI assistant for <audience>.
Always:
- Ask for missing context in one sentence.
- Show a numbered plan before long answers.
- Cite tools or docs you relied on.
Avoid speculation; say "I don't know" when uncertain.
```

Pair this with 3–5 **few-shot examples** built from your seed workflows. Codex can help draft these examples quickly—treat them as prototypes you will edit for accuracy and tone.

## Build the first evaluation loop

Before fine-tuning anything, run the baseline prompt against your seed examples:

1. Call Codex with the prompt and each input.
2. Score the responses manually using three criteria: **correctness**, **actionability**, and **safety**.
3. Capture issues in a short log (one line per failure) to drive revisions.

This loop surfaces where the prompt is unclear or where extra instructions are needed. Keep iterations tight: revise, rerun, and note the delta in quality.

## Grow structured training data

Once the baseline is stable, expand the dataset:

- **Synthesize more examples with Codex**, then review them for accuracy.
- **Source real transcripts** from support channels or internal documentation, anonymizing sensitive details.
- **Label outputs** with short rationales (why the answer is good or bad). These labels make future fine-tuning or preference optimization faster.

Aim for diversity: edge cases, multilingual queries, and safety-sensitive prompts.

## Plan for fine-tuning and tooling

When the prompt stabilizes and evaluations trend upward, plan the first model adaptation:

- Start with **prompt-only** updates to keep iteration fast.
- Move to **fine-tuning** once you have hundreds of high-quality, labeled interactions.
- Introduce **tooling hooks** (search, calculators, policy checkers) and teach the model when to call them through explicit examples.

Codex remains useful here: generate tool-call skeletons, draft unit tests for tool outputs, and propose guardrails that your application layer can enforce.

## Next steps for this project

- Publish the charter and initial prompt for peer review.
- Automate the evaluation loop so every prompt change is scored against the seed set.
- Define success metrics (e.g., 85% correctness on the seed set, zero unsafe outputs) before expanding the scope.

This blogpost marks the starting point. With a Codex-bootstrapped baseline and a tight evaluation loop, we can iterate confidently toward a reliable, production-ready AI assistant.

### Quick Starter Checklist

- [ ] Charter written and pinned.
- [ ] Seed workflows documented with desired outputs.
- [ ] Baseline prompt with 3–5 few-shot examples.
- [ ] Manual evaluation sheet with scoring rubric.
- [ ] Automation script to replay evaluations after each change.
