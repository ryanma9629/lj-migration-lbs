# Claim Gold Demo Mock Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a two-account `claim_gold` demo chain in the legacy app using mock MySQL data so `claimer_gold` can submit a claim and `verifier_gold` can review it through the original pages.

**Architecture:** Keep the existing `claim_gold` and `claim_gold_verify` pages intact and satisfy their runtime expectations by adding focused SQL seed data under `legacy/docker/mysql/init/`. Extend the existing reduced security/menu seed with two demo users, minimal menu bindings, minimal org/employee data, one approval mapping, and a small reusable `GOLD_EMP_RELA` dataset. Validate with HTTP login flows against the running Docker stack before considering any source edits.

**Tech Stack:** MySQL 5.7 in Docker, Wabacus XML pages, legacy Java server actions, shell, `curl`, SQL seed scripts

---

## File Structure

### Files to Create

- `legacy/docker/mysql/init/41-seed-claim-gold-demo-users.sql`
- `legacy/docker/mysql/init/42-seed-claim-gold-demo-master-data.sql`
- `legacy/docker/mysql/init/43-seed-claim-gold-demo-business.sql`
- `legacy/docs/claim-gold-demo-accounts.md`

### Files to Modify

- `legacy/docker/mysql/init/24-enable-claim-gold-pages.sql`
- `legacy/docker/mysql/init/25-seed-claim-gold-demo.sql`
- `legacy/docs/legacy-docker-runbook.md`
- `legacy/docs/compatibility-backlog.md`

### Files to Read While Implementing

- `docs/superpowers/specs/2026-06-30-claim-gold-demo-mock-design.md`
- `legacy/src/reportconfig/report/claim_gold.xml`
- `legacy/src/reportconfig/report/claim_gold_verify.xml`
- `legacy/src/com/customer/util/SubmitClaimGold.java`

### Validation Targets

- Login page: `http://127.0.0.1:18080/LBIBS/jsp/login/login.html`
- Claim page: `ShowReport.wx?PAGEID=claim_gold`
- Verify page: `ShowReport.wx?PAGEID=claim_gold_verify`

---

### Task 1: Seed Demo Users, Groups, Menus, and Page Access

**Files:**
- Create: `legacy/docker/mysql/init/41-seed-claim-gold-demo-users.sql`
- Modify: `legacy/docker/mysql/init/24-enable-claim-gold-pages.sql`
- Test: Docker MySQL seed import plus login-visible menu verification

- [ ] **Step 1: Confirm the demo-user seed file does not exist yet**

Run:

```bash
test -f legacy/docker/mysql/init/41-seed-claim-gold-demo-users.sql
```

Expected: command exits non-zero because the seed file is not present yet.

- [ ] **Step 2: Create the demo-user and menu seed script**

```sql
SET NAMES utf8mb4;

USE cst;

DELETE FROM SYS_C_APP_MNLT WHERE GROUP_ID IN ('gold_claimer_group','gold_verifier_group');
DELETE FROM SYS_C_SEC_GPPV WHERE GROUP_ID IN ('gold_claimer_group','gold_verifier_group');
DELETE FROM SYS_C_SEC_USER_GROUP WHERE USER_ID IN ('claimer_gold','verifier_gold');
DELETE FROM SYS_C_SEC_USER WHERE USER_ID IN ('claimer_gold','verifier_gold');
DELETE FROM SYS_C_SEC_GROP WHERE GROUP_ID IN ('gold_claimer_group','gold_verifier_group');
DELETE FROM SYS_C_SEC_PRIV WHERE PRIVILEGE_ID IN ('gold_claimer_priv','gold_verifier_priv');

INSERT INTO SYS_C_SEC_USER (USER_ID, PASSWORD, USER_NAME, IS_ENABLE, DEPARTMENT, LM_USER, LM_TIME)
VALUES
  ('claimer_gold', 'Due2bkAVWVY=', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE8AEA4E9A286E59198 USING utf8mb4), 'Y', 'GOLD-DEMO', 'seed', NOW()),
  ('verifier_gold', 'Due2bkAVWVY=', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE5AEA1E6A0B8E59198 USING utf8mb4), 'Y', 'GOLD-DEMO', 'seed', NOW());

INSERT INTO SYS_C_SEC_GROP (GROUP_ID, GROUP_DESCRIPTION, SERVICE_ID, LM_USER, LM_TIME)
VALUES
  ('gold_claimer_group', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE8AEA4E9A286E7BB84 USING utf8mb4), '060', 'seed', NOW()),
  ('gold_verifier_group', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE5AEA1E6A0B8E7BB84 USING utf8mb4), '060', 'seed', NOW());

INSERT INTO SYS_C_SEC_USER_GROUP (USER_ID, GROUP_ID, LM_USER, LM_TIME, UR_NO)
VALUES
  ('claimer_gold', 'gold_claimer_group', 'seed', NOW(), 'seed'),
  ('verifier_gold', 'gold_verifier_group', 'seed', NOW(), 'seed');

INSERT INTO SYS_C_SEC_PRIV (PRIVILEGE_ID, PRIVILEGE_NAME, SERVICE_ID, LM_USER, LM_TIME)
VALUES
  ('gold_claimer_priv', 'gold_claimer_priv', '060', 'seed', NOW()),
  ('gold_verifier_priv', 'gold_verifier_priv', '060', 'seed', NOW());

INSERT INTO SYS_C_SEC_GPPV (GROUP_ID, PRIVILEGE_ID, SERVICE_ID, LM_USER, LM_TIME)
VALUES
  ('gold_claimer_group', 'gold_claimer_priv', '060', 'seed', NOW()),
  ('gold_verifier_group', 'gold_verifier_priv', '060', 'seed', NOW());

INSERT INTO SYS_C_APP_MNLT (ID, MENU_ID, GROUP_ID, PAGE_ID, PAGE_NAME, URL_PARAM, SEQ, IS_SHOW, LM_USER, LM_TIME)
VALUES
  ('gold_claimer_home', 'menu_home', 'gold_claimer_group', 'home', CONVERT(0xE999A6E9A1B5 USING utf8mb4), NULL, 1, 'Y', 'seed', NOW()),
  ('gold_claimer_claim', 'menu_home', 'gold_claimer_group', 'claim_gold', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286 USING utf8mb4), NULL, 2, 'Y', 'seed', NOW()),
  ('gold_verifier_home', 'menu_home', 'gold_verifier_group', 'home', CONVERT(0xE999A6E9A1B5 USING utf8mb4), NULL, 1, 'Y', 'seed', NOW()),
  ('gold_verifier_verify', 'menu_home', 'gold_verifier_group', 'claim_gold_verify', CONVERT(0xE8B4B5E98791E5B19EE8AEA4E9A286E5AEA1E6A0B8 USING utf8mb4), NULL, 2, 'Y', 'seed', NOW());
```

- [ ] **Step 3: Extend page-privilege seed for the two new privileges**

```sql
INSERT INTO sys_c_sec_pvlt
  (ID, PRIVILEGE_ID, PAGE_ID, COMPONENT_ID, PART_TYPE, PART_ID, PERMISSION_TYPE, PERMISSION_VALUE, LM_USER, LM_TIME)
VALUES
  ('pvlt_gold_claimer_claim_gold', 'gold_claimer_priv', 'claim_gold', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_gold_verifier_claim_gold_verify', 'gold_verifier_priv', 'claim_gold_verify', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW()),
  ('pvlt_gold_verifier_claim_gold_vfy_no', 'gold_verifier_priv', 'claim_gold_vfy_no', 'common_vpanel', NULL, NULL, 'display', 'true', 'seed', NOW());
```

- [ ] **Step 4: Import the updated page and user seeds into the running stack**

Run:

```bash
/bin/zsh -lc "docker compose exec -T mysql mysql -uwabacus -pwabacus < legacy/docker/mysql/init/24-enable-claim-gold-pages.sql && docker compose exec -T mysql mysql -uwabacus -pwabacus < legacy/docker/mysql/init/41-seed-claim-gold-demo-users.sql"
```

Expected: both imports finish with no SQL error output.

- [ ] **Step 5: Verify the demo users exist**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select USER_ID,USER_NAME from cst.SYS_C_SEC_USER where USER_ID in ('claimer_gold','verifier_gold') order by USER_ID;" 
```

Expected: returns two rows for `claimer_gold` and `verifier_gold`.

- [ ] **Step 6: Verify `claimer_gold` can log in and see the claim page entry**

Run:

```bash
/bin/zsh -lc "curl -sS -c /tmp/lbs-claimer-cookie.txt http://127.0.0.1:18080/LBIBS/jsp/login/login.html >/dev/null && curl -sS -L -b /tmp/lbs-claimer-cookie.txt -c /tmp/lbs-claimer-cookie.txt -d 'TxtUserID=claimer_gold' -d 'TxtPassword=12345' http://127.0.0.1:18080/LBIBS/jsp/login/login.jsp | rg -n '欢迎您|贵金属认领|首页'"
```

Expected: output contains `欢迎您` plus `贵金属认领`.

- [ ] **Step 7: Commit the security/menu seed layer**

```bash
git add legacy/docker/mysql/init/24-enable-claim-gold-pages.sql legacy/docker/mysql/init/41-seed-claim-gold-demo-users.sql
git commit -m "feat: seed claim gold demo users and access"
```

---

### Task 2: Seed Demo Org, Employee, and Approval Mapping Data

**Files:**
- Create: `legacy/docker/mysql/init/42-seed-claim-gold-demo-master-data.sql`
- Test: direct SQL checks for employee/org/mapping rows

- [ ] **Step 1: Create the master-data seed script**

```sql
SET NAMES utf8mb4;

USE ibs;

DELETE FROM T9_SP_GROUPID WHERE GROUP_ID='gold_verifier_group' AND BIZ_TYP=CONVERT(0xE8B4B5E98791E5B19EE4B89AE58AA1 USING utf8mb4);
DELETE FROM T5_EMP WHERE EMP_ID IN ('claimer_gold','verifier_gold');
DELETE FROM T5_ORG WHERE ORG_ID IN ('900100','900200','900000');

INSERT INTO T5_ORG (ORG_ID, ORG_NM, ORG_TYPE_ID, ORG_LEVEL_ID, BRANCH_ORG_ID, BRANCH_ORG_NM, HEAD_ORG_ID, HEAD_ORG_NM)
VALUES
  ('900000', CONVERT(0xE6BC94E7A4BAE680BBE8A18C USING utf8mb4), 'AO', '3', '900200', CONVERT(0xE6BC94E7A4BAE58886E8A18C USING utf8mb4), '900000', CONVERT(0xE6BC94E7A4BAE680BBE8A18C USING utf8mb4)),
  ('900200', CONVERT(0xE6BC94E7A4BAE58886E8A18C USING utf8mb4), 'AO', '2', '900200', CONVERT(0xE6BC94E7A4BAE58886E8A18C USING utf8mb4), '900000', CONVERT(0xE6BC94E7A4BAE680BBE8A18C USING utf8mb4)),
  ('900100', CONVERT(0xE6BC94E7A4BAE694AFE8A18C USING utf8mb4), 'AO', '1', '900200', CONVERT(0xE6BC94E7A4BAE58886E8A18C USING utf8mb4), '900000', CONVERT(0xE6BC94E7A4BAE680BBE8A18C USING utf8mb4));

INSERT INTO T5_EMP (EMP_ID, EMP_NM, ORG_ID, BRANCH_ORG_ID, HEAD_ORG_ID)
VALUES
  ('claimer_gold', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE8AEA4E9A286E59198 USING utf8mb4), '900100', '900200', '900000'),
  ('verifier_gold', CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE5AEA1E6A0B8E59198 USING utf8mb4), '900200', '900200', '900000');

INSERT INTO T9_SP_GROUPID (GROUP_ID, BIZ_TYP, SP_TYP, IS_FS, IS_CS, SEQ)
VALUES
  ('gold_verifier_group', CONVERT(0xE8B4B5E98791E5B19EE4B89AE58AA1 USING utf8mb4), CONVERT(0xE68C89E983A8E997A8 USING utf8mb4), '1', '1', 1);
```

- [ ] **Step 2: Import the master-data seed into MySQL**

Run:

```bash
/bin/zsh -lc "docker compose exec -T mysql mysql -uwabacus -pwabacus < legacy/docker/mysql/init/42-seed-claim-gold-demo-master-data.sql"
```

Expected: import finishes with no SQL error output.

- [ ] **Step 3: Verify the org rows**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select ORG_ID,ORG_LEVEL_ID,BRANCH_ORG_ID,HEAD_ORG_ID from ibs.T5_ORG where ORG_ID in ('900000','900200','900100') order by ORG_ID;"
```

Expected: returns three rows covering one head org, one branch org, and one sub-branch org.

- [ ] **Step 4: Verify the employee rows**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select EMP_ID,ORG_ID,BRANCH_ORG_ID,HEAD_ORG_ID from ibs.T5_EMP where EMP_ID in ('claimer_gold','verifier_gold') order by EMP_ID;"
```

Expected: returns two rows tied to the seeded orgs.

- [ ] **Step 5: Verify the approval mapping row**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select GROUP_ID,BIZ_TYP,SP_TYP,IS_FS,IS_CS from ibs.T9_SP_GROUPID where GROUP_ID='gold_verifier_group';"
```

Expected: returns one `gold_verifier_group` row for the gold business type.

- [ ] **Step 6: Commit the master-data layer**

```bash
git add legacy/docker/mysql/init/42-seed-claim-gold-demo-master-data.sql
git commit -m "feat: seed claim gold demo master data"
```

---

### Task 3: Seed Reusable Claim Gold Demo Business Rows

**Files:**
- Modify: `legacy/docker/mysql/init/25-seed-claim-gold-demo.sql`
- Create: `legacy/docker/mysql/init/43-seed-claim-gold-demo-business.sql`
- Test: direct SQL checks on `IBS.GOLD_EMP_RELA`

- [ ] **Step 1: Move the existing single-row demo into a reusable multi-row seed**

```sql
SET NAMES utf8mb4;

USE ibs;

DELETE FROM GOLD_EMP_RELA
WHERE TXN_RUN_NBR IN ('GOLDDEMO1001','GOLDDEMO1002','GOLDDEMO1003');

INSERT INTO GOLD_EMP_RELA
  (TXN_RUN_NBR, VUCH_NBR, EMP_ID, RATIO, CLAIM_STATUS_ID, CLAIM_DT, VERIFY_DT, VERIFY_EMP_ID, REMARK, REMARK1,
   ORG_ID, ORG_NM, CST_NM, IDENTN_NO, BIZ_TYPE_NM, VUCH_STATUS_NM, TXN_DT, EMP_NM, EMP_ORG_ID, EMP_ORG_NM,
   MARKETING_NO, TXN_AMT, PRD_NUM, PRD_CD, PRD_NM, MID_INC)
VALUES
  ('GOLDDEMO1001', 'GOLDVUCH1001', '000000', 0.00, '7', NULL, NULL, NULL, NULL, NULL,
   '900100', CONVERT(0xE6BC94E7A4BAE694AFE8A18C USING utf8mb4), CONVERT(0xE6BC94E7A4BAE8B4B5E98791E5B19EE5AEA2E688B7E4B880 USING utf8mb4), 'IDGOLD1001',
   CONVERT(0xE8B4B5E98791E5B19EE4B89AE58AA1 USING utf8mb4), CONVERT(0xE6ADA3E5B8B8 USING utf8mb4), '2026-03-25',
   '', '', '', 'MKTGOLD1001', 88000.000, 2, 'GOLDPRD01', CONVERT(0xE6BC94E7A4BAE8B4B5E98791E4BAA7E59381E4B880 USING utf8mb4), 2600.000),
  ('GOLDDEMO1002', 'GOLDVUCH1002', 'claimer_gold', 60.00, '1', '2026-03-26', NULL, NULL, CONVERT(0xE8AEA4E9A286E6BC94E7A4BAE5B7B2E68F90E4BAA4 USING utf8mb4), '',
   '900100', CONVERT(0xE6BC94E7A4BAE694AFE8A18C USING utf8mb4), CONVERT(0xE6BC94E7A4BAE8B4B5E98791E5B19EE5AEA2E688B7E4BA8C USING utf8mb4), 'IDGOLD1002',
   CONVERT(0xE8B4B5E98791E5B19EE4B89AE58AA1 USING utf8mb4), CONVERT(0xE6ADA3E5B8B8 USING utf8mb4), '2026-03-26',
   CONVERT(0xE8B4B5E98791E5B19EE6BC94E7A4BAE8AEA4E9A286E59198 USING utf8mb4), '900100', CONVERT(0xE6BC94E7A4BAE694AFE8A18C USING utf8mb4), 'MKTGOLD1002', 65000.000, 1, 'GOLDPRD02', CONVERT(0xE6BC94E7A4BAE8B4B5E98791E4BAA7E59381E4BA8C USING utf8mb4), 1800.000),
  ('GOLDDEMO1003', 'GOLDVUCH1003', '000000', 0.00, '7', NULL, NULL, NULL, NULL, NULL,
   '900100', CONVERT(0xE6BC94E7A4BAE694AFE8A18C USING utf8mb4), CONVERT(0xE5A487E794A8E8B4B5E98791E5B19EE5AEA2E688B7 USING utf8mb4), 'IDGOLD1003',
   CONVERT(0xE8B4B5E98791E5B19EE4B89AE58AA1 USING utf8mb4), CONVERT(0xE6ADA3E5B8B8 USING utf8mb4), '2026-03-27',
   '', '', '', 'MKTGOLD1003', 72000.000, 3, 'GOLDPRD03', CONVERT(0xE5A487E794A8E8B4B5E98791E4BAA7E59381 USING utf8mb4), 2100.000);
```

- [ ] **Step 2: Save the multi-row business seed as a dedicated script**

```sql
SOURCE legacy/docker/mysql/init/25-seed-claim-gold-demo.sql;
```

- [ ] **Step 3: Import the business seed**

Run:

```bash
/bin/zsh -lc "docker compose exec -T mysql mysql -uwabacus -pwabacus < legacy/docker/mysql/init/25-seed-claim-gold-demo.sql"
```

Expected: import finishes with no SQL error output.

- [ ] **Step 4: Verify the seeded gold rows**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select TXN_RUN_NBR,EMP_ID,CLAIM_STATUS_ID,ORG_ID from ibs.GOLD_EMP_RELA where TXN_RUN_NBR in ('GOLDDEMO1001','GOLDDEMO1002','GOLDDEMO1003') order by TXN_RUN_NBR;"
```

Expected: returns three rows, including one `CLAIM_STATUS_ID='1'` row and two pending rows.

- [ ] **Step 5: Commit the business demo seed**

```bash
git add legacy/docker/mysql/init/25-seed-claim-gold-demo.sql legacy/docker/mysql/init/43-seed-claim-gold-demo-business.sql
git commit -m "feat: seed claim gold demo business rows"
```

---

### Task 4: Verify the Claimer Submit Path End-to-End

**Files:**
- Create: `legacy/docs/claim-gold-demo-accounts.md`
- Modify: `legacy/docs/legacy-docker-runbook.md`
- Test: HTTP login flow plus direct page fetches

- [ ] **Step 1: Document the demo accounts and intended flow**

```md
# Claim Gold Demo Accounts

- `admin` / `12345`: system-management and debugging entry
- `claimer_gold` / `12345`: claim-side demo user
- `verifier_gold` / `12345`: verify-side demo user

Demo record set:

- `GOLDDEMO1001`: pending claim row for submit testing
- `GOLDDEMO1002`: pre-submitted row for verify-page visibility
- `GOLDDEMO1003`: spare pending row for repeated demos
```

- [ ] **Step 2: Verify the claimer page opens and lists a seeded row**

Run:

```bash
/bin/zsh -lc "curl -sS -c /tmp/lbs-claimer-cookie.txt http://127.0.0.1:18080/LBIBS/jsp/login/login.html >/dev/null && curl -sS -L -b /tmp/lbs-claimer-cookie.txt -c /tmp/lbs-claimer-cookie.txt -d 'TxtUserID=claimer_gold' -d 'TxtPassword=12345' http://127.0.0.1:18080/LBIBS/jsp/login/login.jsp >/dev/null && curl -sS -L -b /tmp/lbs-claimer-cookie.txt 'http://127.0.0.1:18080/LBIBS/ShowReport.wx?PAGEID=claim_gold&VUCH_NBR=GOLDVUCH1001' | rg -n 'GOLDDEMO1001|GOLDVUCH1001|贵金属认领|认领信息'"
```

Expected: output contains the page title and the seeded `GOLDDEMO1001` row identifiers.

- [ ] **Step 3: Submit the pending row through the existing UI or scripted request**

Run:

```bash
echo "Use the browser or existing scripted submit path to move GOLDDEMO1001 from CLAIM_STATUS_ID='7' to '1' as claimer_gold."
```

Expected: the row is submitted successfully with no runtime exception.

- [ ] **Step 4: Verify the database reflects the submit**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select TXN_RUN_NBR,EMP_ID,RATIO,CLAIM_STATUS_ID,EMP_ORG_ID from ibs.GOLD_EMP_RELA where TXN_RUN_NBR='GOLDDEMO1001' order by EMP_ID;"
```

Expected: one row for `GOLDDEMO1001` now has `EMP_ID='claimer_gold'` and `CLAIM_STATUS_ID='1'`.

- [ ] **Step 5: Commit the claimer verification docs**

```bash
git add legacy/docs/claim-gold-demo-accounts.md legacy/docs/legacy-docker-runbook.md
git commit -m "docs: record claim gold demo claimer flow"
```

---

### Task 5: Verify the Reviewer Approve/Reject Paths and Capture Any Minimal Fallbacks

**Files:**
- Modify: `legacy/docs/legacy-docker-runbook.md`
- Modify: `legacy/docs/compatibility-backlog.md`
- Test: HTTP login flow for reviewer page plus DB status checks

- [ ] **Step 1: Verify the reviewer page shows the pre-submitted demo row**

Run:

```bash
/bin/zsh -lc "curl -sS -c /tmp/lbs-verifier-cookie.txt http://127.0.0.1:18080/LBIBS/jsp/login/login.html >/dev/null && curl -sS -L -b /tmp/lbs-verifier-cookie.txt -c /tmp/lbs-verifier-cookie.txt -d 'TxtUserID=verifier_gold' -d 'TxtPassword=12345' http://127.0.0.1:18080/LBIBS/jsp/login/login.jsp >/dev/null && curl -sS -L -b /tmp/lbs-verifier-cookie.txt 'http://127.0.0.1:18080/LBIBS/ShowReport.wx?PAGEID=claim_gold_verify&VUCH_NBR=GOLDVUCH1002' | rg -n 'GOLDDEMO1002|GOLDVUCH1002|贵金属认领审核|通过|不通过'"
```

Expected: output contains `GOLDDEMO1002` and the verify actions.

- [ ] **Step 2: Approve one reviewer-visible row**

Run:

```bash
echo "Use the browser or existing scripted page action to approve GOLDDEMO1002 as verifier_gold."
```

Expected: the row moves from `CLAIM_STATUS_ID='1'` to `CLAIM_STATUS_ID='2'`.

- [ ] **Step 3: Verify the approve result in MySQL**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select TXN_RUN_NBR,CLAIM_STATUS_ID,VERIFY_EMP_ID from ibs.GOLD_EMP_RELA where TXN_RUN_NBR='GOLDDEMO1002';"
```

Expected: the row shows `CLAIM_STATUS_ID='2'` and `VERIFY_EMP_ID='verifier_gold'`.

- [ ] **Step 4: Reject one reviewer-visible row through the popup flow**

Run:

```bash
echo "Use the browser or existing scripted popup flow to reject the submitted GOLDDEMO1001 row as verifier_gold."
```

Expected: the popup save succeeds and the row moves to `CLAIM_STATUS_ID='3'`.

- [ ] **Step 5: Verify the reject result in MySQL**

Run:

```bash
docker compose exec -T mysql mysql -uwabacus -pwabacus -N -e "select TXN_RUN_NBR,CLAIM_STATUS_ID,VERIFY_EMP_ID,REMARK1 from ibs.GOLD_EMP_RELA where TXN_RUN_NBR='GOLDDEMO1001';"
```

Expected: the row shows `CLAIM_STATUS_ID='3'`, `VERIFY_EMP_ID='verifier_gold'`, and a non-empty reject reason.

- [ ] **Step 6: If seed-only restoration fails, document the exact blocker before any code edit**

```md
## claim_gold demo fallback

- blocker:
- page / SQL / interceptor involved:
- evidence:
- smallest acceptable workaround:
```

- [ ] **Step 7: Commit the reviewer verification notes**

```bash
git add legacy/docs/legacy-docker-runbook.md legacy/docs/compatibility-backlog.md
git commit -m "docs: record claim gold demo reviewer flow"
```
