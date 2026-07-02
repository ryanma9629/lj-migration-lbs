# Legacy Product Reverse-Spec Overview

## Purpose

This document is a reverse-engineered product overview for driving a new implementation of the legacy system with a modern stack such as Spring Boot + Vue.

It is not intended to preserve JSP/Wabacus implementation details.
It is intended to preserve business logic, workflow, role boundaries, and data semantics.

## Confidence Labels

- `Confirmed`
  - directly supported by current source code, SQL, verified runtime behavior, or restored demo data
- `Inferred`
  - high-probability interpretation based on source structure, naming, and partial runtime evidence
- `Open`
  - not yet safely reconstructable from current materials

## Product Summary

`Confirmed`

The system is a bank performance-attribution and approval platform.
It takes business records from multiple business lines, places them into pending attribution pools, lets users claim ownership or attribution ratios, routes those claims through one or more approval stages, and then exposes the resulting records to later adjustment, query, and assessment-related modules.

In plainer terms, the core problem the system solves is:

> which person or organization should this business result be counted toward?

## Primary Functional Areas

### 1. Claim Modules

`Confirmed`

These modules let a user claim business records from a specific business line.

Current recovered examples:

- insurance claim
- payroll claim
- loan claim
- wealth-management transaction claim
- third-party custody claim
- housing-fund claim
- fund claim
- gold claim
- deposit claim

Shared pattern:

1. query business voucher or business record
2. load editable claim detail
3. save ratio / note / claimant identity
4. submit into approval flow

### 2. Approval Modules

`Confirmed`

These modules let an approver view pending claimed records and approve or reject them.

Current recovered examples:

- gold claim approval
- fund claim approval
- claim approval first-stage modules
- branch/final approval modules
- business-line specific approval modules

Shared pattern:

1. list pending records visible to current approver scope
2. allow approve
3. allow reject with reason
4. update claim status and approver information

### 3. Claim Adjustment Modules

`Confirmed`

These modules support changing an already claimed attribution and routing the change through another approval step.

Current recovered examples:

- `claimed_change`
- `claimed_change_fs`

### 4. My Claims / Query Modules

`Confirmed`

These modules let users inspect their own claimed items, adjustment history, and approved claim results.

Current recovered examples:

- `my_claimed`
- `my_claim_info`
- `claim_info`
- `claimed_info`

### 5. Assessment Support Modules

`Confirmed`

The system also contains modules that appear to support staff lists, transitional assessment data, and downstream assessment management.

Current recovered example:

- `emp_gdq`

`Inferred`

These modules likely support performance-policy administration or assessment prerequisites rather than direct claim initiation.

## Core Roles

### Claimer

`Confirmed`

- can search for claimable business records
- can save attribution data
- can submit a claim into approval flow
- can only claim their own data in at least some modules

### Approver

`Confirmed`

- can view pending submitted claims
- can approve or reject
- visibility is limited by organization scope in at least some modules

### Adjustment Operator

`Confirmed`

- can initiate post-claim adjustments on existing claimed data

### Administrator

`Confirmed`

- can access system-management pages
- in the current restored demo, can also see many business pages through simplified demo menu binding

## Common Workflow Pattern

`Confirmed`

Most claim modules follow a common lifecycle:

1. a business record exists in a pending pool
2. a claimant opens it and enters attribution data
3. save changes the row into a drafted or temporary claimed state
4. submit moves the row into pending approval
5. approver approves or rejects
6. approved rows become visible to downstream query / adjustment / later approval stages

## Common Status Semantics

`Confirmed`

The exact codes vary by module, but the recurring meanings are:

- draft / temporary saved
- pending approval
- approved
- rejected
- adjusted / pending re-approval
- final approved at later stage

`Inferred`

The system uses similar workflow semantics across business lines, even where individual table names differ.

## Permission and Data-Scope Model

`Confirmed`

Permissions are page-based and group-based.
Menus are built from:

- `CST.SYS_C_APP_MENU`
- `CST.SYS_C_APP_MNLT`
- `CST.SYS_C_SEC_USER_GROUP`
- `CST.SYS_C_SEC_GPPV`
- `CST.SYS_C_SEC_PVLT`

Runtime menu generation and page permission filtering are implemented in:

- `legacy/src/com/customer/security/GlobalInterceptor.java`

`Confirmed`

At least some approval pages filter visible data by:

- current organization
- branch organization
- head organization

`Open`

The full original production role taxonomy is not yet reconstructable from the reduced demo seed alone.

## Data Model Layers

`Confirmed`

The legacy design appears to separate:

- business-source records
- claim attribution records
- approval records or approval-state columns
- adjustment records
- user / organization / privilege metadata

`Inferred`

The new system should preserve these as business-layer concepts even if the physical schema is redesigned.

## Recommended New-System Spec Structure

`Confirmed`

The following five topics are the highest-value reverse-spec targets for a new implementation:

1. business workflows
2. roles and permission scopes
3. module boundaries
4. core data model
5. state machines and transition rules

## Current Reverse-Spec Strategy

`Confirmed`

The recommended approach is:

1. maintain this overview as the product/system skeleton
2. produce one module specification per major business module
3. mark each rule as `Confirmed`, `Inferred`, or `Open`
4. prioritize modules whose restored demo chain is already stable

## Current Best Sample Module

`Confirmed`

`claim_gold` is currently the best sample module for building the first complete reverse spec because:

- its claim flow is restored
- its approval flow is restored
- its role split is explicit
- its runtime behavior has been verified with demo users and demo data

## Open Questions

- what was the original production menu tree and top-level business menu grouping?
- which approval modules were first-stage, branch-stage, and final-stage in the original operating model?
- how much downstream performance calculation happened inside this system versus in later reporting/assessment systems?
- which schema differences reflect missing DDL versus source-code/version drift?
