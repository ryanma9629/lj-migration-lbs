# Missing Runtime Components

This file tracks legacy runtime support files or packages that are currently missing, or strongly suspected to be missing, from the Dockerized revival environment.

Purpose:

- give you a focused checklist to search in the original deployment environment
- separate shared runtime gaps from page-specific migration notes
- avoid losing evidence scattered across run logs and page-level backlog items

## Confirmed Runtime Asset Gaps

### `/LBIBS/webresources/component/wabacus_component.js`

- Status:
  - Originally confirmed missing in current Docker runtime
  - Now restored locally into the repo from a user-provided file
  - Current evidence indicates the restored file is still not a complete match for this application's expected frontend runtime
- Evidence:
  - The original `404` is gone after rebuilding the app container
  - `claim_dep` page button flow still does not emit save/update requests
  - browser runtime errors still observed during edit-page interaction:
    - `boxMetadataObj.getAttribute is not a function`
  - `claim_dep_FH` no longer 404s the file, but still throws:
    - `refreshComponentDisplay(...) is not a function`
  - `claim_dep_FH` page startup still falls into repeated background refresh requests
- Why this matters:
  - this is a shared Wabacus editable-component runtime file
  - the current restored copy improves behavior, but does not yet satisfy all functions expected by this legacy app
- Recovery action taken:
  - copied into the repo at:
    - [wabacus_component.js](/Users/ryanma/work/lj-migration-lbs/legacy/WebContent/webresources/component/wabacus_component.js)
- Current working interpretation:
  - the problem is no longer “file missing”
  - the problem is now more likely “runtime bundle/version mismatch” or “missing companion frontend files”
- Upstream comparison:
  - public `wabacus_src` source tree contains `webresources/wabacus_system.js`, `wabacus_editsystem.js`, `wabacus_api.js`, etc.
  - but no standalone `wabacus_component.js` was found there
- Suggested places to look in the original environment:
  - deployed app static directory under `LBIBS/webresources/component/`
  - full original `webresources/` tree, not only this single file
  - any historical Wabacus distribution package used by this project
  - older application backup zips or exploded Tomcat webapp directories

### `/LBIBS/webresources/component/jquery-1.4.4.min.js`

- Status:
  - Originally confirmed missing in current Docker runtime
  - Now restored locally into the repo
- Evidence:
  - Browser request returns `404`
  - requested automatically by legacy Wabacus page runtime
- Why this matters:
  - some Wabacus frontend code may assume this exact jQuery version or its load order
  - current project does contain `legacy/WebContent/js/jquery-1.7.2.min.js`, but that is not the same requested path or version
- Local search result:
  - no file named `jquery-1.4.4.min.js` exists under the current repo
  - no local copy was found under `/Users/ryanma`
- Recovery action taken:
  - downloaded from the historical Microsoft CDN lineage and stored at:
    - [jquery-1.4.4.min.js](/Users/ryanma/work/lj-migration-lbs/legacy/WebContent/webresources/component/jquery-1.4.4.min.js)
  - current verification shows this specific 404 is gone after rebuilding the app container
- Suggested places to look in the original environment:
  - `LBIBS/webresources/component/`
  - Wabacus runtime package or vendor bundle
  - old Tomcat exploded deployment directories

## Strongly Suspected Missing Runtime Package

### Original Wabacus frontend static bundle

- Status:
  - strongly suspected incomplete in the current repo/runtime
- Evidence:
  - the current repo has many Wabacus static files under `legacy/WebContent/webresources/`
  - but the runtime still requests files that do not exist in the repo:
    - `webresources/component/wabacus_component.js`
    - `webresources/component/jquery-1.4.4.min.js`
  - this pattern suggests the copied source tree did not include the full frontend runtime set from the original deployment
- Why this matters:
  - this would explain why some read-only or simpler pages work, while richer editable pages fail in browser-side behavior
- Suggested recovery target:
  - find the complete original `webresources/` tree from the production or test deployment
  - compare it directory-by-directory with:
    - `legacy/WebContent/webresources/`

## Not Missing, But Useful Reference

### Wabacus backend jar set

- Status:
  - present in current Docker runtime
- Evidence:
  - `legacy/docker/app/lib/wabacus-4.1.jar` exists
  - app startup and many pages already work, so backend Wabacus classes are broadly available
- Why this note is here:
  - to avoid spending time re-searching already restored backend jars when the current blocker is frontend runtime

## Search Summary Already Performed

- Current repo search:
  - originally no `wabacus_component.js`
  - originally no `jquery-1.4.4.min.js`
- Local machine search under `/Users/ryanma`:
  - originally no `wabacus_component.js`
  - originally no `jquery-1.4.4.min.js`
- Public `wabacus_src` comparison:
  - found standard Wabacus scripts such as:
    - `webresources/wabacus_system.js`
    - `webresources/wabacus_editsystem.js`
    - `webresources/wabacus_util.js`
    - `webresources/wabacus_api.js`
  - did not find:
    - `wabacus_component.js`
    - `jquery-1.4.4.min.js`

## Recommended Next Search Order In The Original Environment

1. Search the original deployed `LBIBS` exploded webapp for the full frontend runtime subtree:
   - `webresources/component/`
   - `webresources/script/`
2. Prefer copying the whole original `webresources/component/` subtree instead of cherry-picking only one file.
3. If the app still references helper functions not present locally, compare the full original `webresources/` tree against:
   - `legacy/WebContent/webresources/`
4. If needed, search the original shared Wabacus installation or vendor package.

## Current Best Guess

- Current evidence after restoring local `jquery-1.4.4.min.js` and a local `wabacus_component.js` copy:
  - `jquery-1.4.4.min.js` no longer 404s
  - `wabacus_component.js` no longer 404s
  - page runtime still throws:
    - `boxMetadataObj.getAttribute is not a function`
    - `refreshComponentDisplay(...) is not a function`
  - `claim_dep` save still does not emit any backend update request
  - `claim_dep_FH` no longer hard-fails on missing asset, but still enters repeated background refresh requests

## Related Current Evidence

- [legacy-docker-runbook.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/legacy-docker-runbook.md)
  - `claim_dep partial recovery` section
- [compatibility-backlog.md](/Users/ryanma/work/lj-migration-lbs/legacy/docs/compatibility-backlog.md)
  - `Claim Dep Module` section
