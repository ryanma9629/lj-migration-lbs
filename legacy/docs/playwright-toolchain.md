# Playwright Toolchain

This project pins a local Playwright toolchain under `legacy/` so browser automation no longer depends on whichever global `npx playwright` version happens to be active.

## Principles

- Use the project-local package version from `legacy/package.json`.
- Default to system Chrome instead of Playwright-managed Chromium.
- Keep browser automation as a secondary tool after `curl`, consistent with `AGENT.md`.

## Install

```bash
cd legacy
npm install
```

## Smoke Check

```bash
cd legacy
npm run pw:check
```

Optional environment overrides:

```bash
cd legacy
PAGEID=claim_ln npm run pw:check
PAGE_URL='http://127.0.0.1:18080/LBIBS/ShowReport.wx?PAGEID=claim_ln&VUCH_NBR=LNDEMO0001' npm run pw:check
LOGIN_USER=admin LOGIN_PASSWORD=12345 npm run pw:check
```

## Codegen

```bash
cd legacy
npm run pw:codegen
```

This opens Playwright codegen against the local login page using system Chrome.
