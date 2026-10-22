
# Git Workflow Practice Log

## Project
Python Basic Calculator

## Initial setup
- Created calculator.py
- Added README.md and .gitignore
- Created the initial commit

## Feature branch workflow
- Branch: feature/add-floor-division
- Feature: Added floor division
- Created and merged a pull request

## Second feature
- Branch: feature/add-modulus
- Feature: Added modulus operation
- Created and merged a pull request

## Merge conflict exercise
- Created a file in two existing branches with conflicting edits
- Observed Git conflict markers
- Resolved the conflict and committed the result

## Lessons learned
- Learned that a file committed and pushed to `main` is not automatically available in existing feature branches until those branches incorporate the latest changes from `main`.
- Initially, I could not find the merge-conflict practice file in my existing feature branches: `feature/add-floor-division` and `feature/add-modulus`.
- Updated both feature branches with the latest changes from `main` using git checkout and pull operations.
- Modified the same conflict-practice file differently in both feature branches and committed the changes separately.
- Merged the feature branches into `main` and encountered a merge conflict because both branches modified the same line differently.
- Learned how Git identifies conflicting changes and requires manual resolution before completing a merge.
- Practised staging the resolved file, committing the merge resolution, and verifying the repository history.
- Understood the importance of keeping feature branches synchronized with `main` and reviewing Git status and commit history throughout the workflow.

