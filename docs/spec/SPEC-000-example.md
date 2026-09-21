# SPEC-000 — Example: Add the GET /hello/{name} endpoint

Status: Approved
PRD: PRD-000
Related decisions: none

## Requirements

- [ ] `GET /hello/{name}` returns a JSON greeting for the given name.
- [ ] A missing or empty name returns 400 with a structured error.
- [ ] The response is a Pydantic model, not a raw dict.

## Design

Add a route handler in `app/main.py` following the existing async handler style. Validate `name` with a Pydantic path parameter so failures return 400 before the handler body runs.

Alternatives considered: validating inside the handler (rejected: duplicates what FastAPI already does) and a separate router module (rejected: single-service project, main.py is the established home).

## Edge cases

- Name with spaces: accept and return it as-is.
- Name longer than 64 characters: 400.
- Missing name: FastAPI returns 422 by default; explicitly map to 400 for consistency with the PRD.

## Plan

1. Add the Pydantic response model.
2. Add the route with validated path parameter.
3. Add tests for happy path and edge cases.
4. Run `make lint` and `make test`.

## Tasks

- [ ] Add `HelloResponse` model.
- [ ] Add `GET /hello/{name}` route.
- [ ] Test happy path.
- [ ] Test spaces and over-length input.
- [ ] Update `.ai/HANDOFF.md`.

## Validation

- Requirement 1: test in `tests/test_hello.py`.
- Requirement 2: 400 cases in the same file.
- Requirement 3: asserted by the response model type and `make lint` (mypy).

## Open questions

- None.

---

This is an illustrative example. Copy the structure, not the content.
