# Contributing Guidelines

This document contains guidelines that all contributions to this template repo
should follow. As an added benefit, these guidelines will provide a reasonable
starting point for any repos based off this template.

> [!IMPORTANT]
> After creating a repo from this template, I'd recommend updating this document
> to suit your own workflows and the contents of your version-controlled
> document.

<!-- omit from toc -->
## Contents

- [Conventional Commits](#conventional-commits)
  - [Breaking Changes](#breaking-changes)
  - [Types](#types)
  - [Scopes](#scopes)

## Conventional Commits

This repository uses
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/). This
policy is enforced automatically by a GitHub action. The fixed commit structure
allows automatic document versioning and changelog generation for releases.

Conventional commits must have a [type](#types), and can optionally also include
a [scope](#scopes). The [types](#types) and [scopes](#scopes) that will be used
in this repo are defined below. Additionally, any [type](#types) can be marked
as a [breaking change](#breaking-changes).

This section won't go into much detail about how to structure a
[Conventional Commit](https://www.conventionalcommits.org/en/v1.0.0/), and
assumes some level of familiarity with the standard.

### Breaking Changes

Breaking changes (preferably always marked with at least a `!` for visibility)
don't really have as rigid of a definition with a version controlled document as
they do in software (i.e. changes to an API), but it's worth defining what you
class as a breaking change based on the contents of your document.

For example, if you're writing a specification, it's fairly self-explanatory. In
other cases, it might be used to indicate that an old section has been removed
or re-worked.

> [!NOTE]
> Remember that conventional commits are case-insensitive, except for the
> `BREAKING CHANGE` footer which must be upper-case.

### Types

The `feat` and `fix` types are defined in the
[conventional commit specification](https://www.conventionalcommits.org/en/v1.0.0/),
and are mandatory. 

- `feat`: Adding a new feature. In the context of a version-controlled document,
  this could indicate a new section being added to the document, or a large
  re-work of material.
- `fix`: Fixing a bug. In the context of a version-controlled document, this
  could indicate small localised changes within a section that do not affect the
  overall meaning (i.e. fixing typos, correcting punctuation).

Additionally, the following types are suggested by
[@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional), and can be used in this repo:

- `chore`: Used for routine / maintenance tasks such as updating the
  `.gitignore`, renaming files or directories, etc.
- `ci`: Indicates changes to the CI configuration files and scripts (i.e.
  GitHub Actions) rather than the main document itself.
- `docs`: Changes to the surrounding documentation (i.e. `README.md` and
  `CONTRIBUTING.md`) rather than the main document itself.
- `revert`: Used when reverting a previous commit.
- `style`: In the context of a version-controlled document could indicate
  changes to the presentation of the document rather than changes to the
  contents (i.e. changes to the font or the border size).
- `test`: Changes to code / commit linter configuration files and scripts.

### Scopes

Scopes are an optional noun that may be provided with a type to provide context
to the area of the repository that a commit changes.

> [!IMPORTANT]
> When consuming this template, the scopes in particular should be updated to
> suit the contents of your repo.

The following scopes are defined for this repository:

- `release`: Changes to the CI system the affect release builds.
- `config`: Changes to configuration files used by the CI system.
- `figures`: Addition or changes to figures included in the document.
