# Changelog

All notable changes to this project are documented here. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `Makefile` with `make lint` (markdownlint + shellcheck) and `make test` (script tests).
- `examples/hello-service` showing a filled-in context after adoption.
- CI status, license, and AGENTS.md badges in the README.

### Changed

- Renamed the project to **ai-agent-relay**.

## [0.1.0] - 2026-09-20

### Added

- Portable, Git-versioned context layer under `.ai/` with a self-driving `AGENTS.md` entry point.
- Plug-and-play bootstrap: reading `AGENTS.md` makes an agent analyze the repository and fill the context automatically, then ask once whether to update it manually or automatically.
- `.ai/HANDOFF.md` with a Resume block for switching agents, models, providers, or machines.
- Learning loop: `.ai/LEARNINGS.md` with promotion and compaction rules, plus `.ai/workflows/capture-learning.md`.
- Usage-limit safety: `.ai/LIMITS.md` thresholds, `.ai/workflows/checkpoint.md`, and rolling checkpoints.
- Switch-agent protocol: `.ai/workflows/switch-agent.md` and `.ai/ADAPTERS.md`.
- Requirements (PRDs) in `.ai/REQUIREMENTS.md` and `docs/prd/`, with `.ai/workflows/feature.md`.
- Decision records for architecture (ADR) and technology (TDR) in `.ai/DECISIONS.md`, with simple and scale modes (`docs/decisions/`).
- Ready-to-install thin adapters in `.ai/adapters/` for Claude Code, Cursor, Kiro, Cline, Roo Code, GitHub Copilot, Gemini CLI, Windsurf, Aider, Zed, and Qwen Code, plus `install.sh` and `bootstrap.sh`. OpenCode and Codex need no adapter.
- Optional infrastructure workflows: implementation, review, security review, Terraform/OpenTofu change, Kubernetes change, and cloud port.
- `docs/design.md` describing why the template is built this way.
- MIT license.

[Unreleased]: https://github.com/crilsen/ai-agent-relay/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/crilsen/ai-agent-relay/releases/tag/v0.1.0
