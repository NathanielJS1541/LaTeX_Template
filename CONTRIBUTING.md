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

- [VSCode Setup](#vscode-setup)
  - [LaTeX Workshop](#latex-workshop)
  - [Paste Image](#paste-image)
  - [Trailing Spaces](#trailing-spaces)
  - [Code Spell Checker](#code-spell-checker)
  - [Markdown All in One](#markdown-all-in-one)
  - [Editor Settings](#editor-settings)
- [Conventional Commits](#conventional-commits)
  - [Breaking Changes](#breaking-changes)
  - [Types](#types)
  - [Scopes](#scopes)
- [Document Revision History](#document-revision-history)

## VSCode Setup

This repo contains a [VSCode workspace](.vscode/) to make setup easier. Simply
open this repo in VSCode and install the recommended VSCode extensions:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop):
  This extension does a majority of the heavy lifting when working with `.tex`
  files including preview, syntax highlighting, linting, formatting,
  intellisense and more. Note that this extension does have some
  [requirements](#latex-workshop).
- [Paste Image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image):
  Allows pasting images directly into markdown documents, and has been
  configured in this workspace to allow pasting directly into `.tex` documents.
- [Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces):
  This just highlights trailing whitespace, which helps keeps the document
  source neater.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker):
  A spell checker that supports most source files.
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one):
  This extension makes it trivial to work with Markdown files in VSCode,
  allowing easy previewing and linting to make repo documentation easy to
  maintain.

> [!NOTE]
> Most of these extensions have been configured in the shared workspace. Any
> changes are detailed below.

### LaTeX Workshop

The [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
extension requires a compatible LaTeX distribution to be available on the system
PATH. See the
[installation requirements](https://github.com/James-Yu/LaTeX-Workshop/wiki/Install#requirements)
for a list of compatible distributions, and make sure you have one installed.
_Note that you may need to restart VSCode after installing a distribution for it
to be recognised!_

The following [workspace settings](.vscode/settings.json) have been configured
for LaTeX Workshop:

```jsonc
{
  // Disable auto clean and retry for LaTeX builds, as if a build fails there is
  // likely an issue that requires fixing manually.
  "latex-workshop.latex.autoBuild.cleanAndRetry.enabled": false,
  // Enable cleaning of the outDir subfolders during build, as the outDir has
  // been specified to a non-root location.
  "latex-workshop.latex.clean.subfolder.enabled": true,
  // Specify a separate outDir to ensure that any artifacts of previews / builds
  // are separated from the source.
  "latex-workshop.latex.outDir": "%DIR%/build",
}
```

### Paste Image

[Paste Image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image)
has been configured to allow pasting into the LaTeX document, won't be able to
paste images into Markdown documents with how it has been configured in the
[workspace settings](.vscode/settings.json):

```jsonc
{
  // Configure Paste Image to insert a LaTeX graphic when pasting an image.
  "pasteImage.insertPattern": "\"\\\\begin{center}\\n\\t\\t\\\\includegraphics[width=\\\\linewidth]{${imageSyntaxPrefix}${imageFilePath}${imageSyntaxSuffix}}\\n\\t\\\\end{center}\"",
  // Configure Paste Image to save images to the root images/ directory.
  "pasteImage.path": "${currentFileDir}/images",
  // When pasting an image, show a prompt to confirm the image path.
  "pasteImage.showFilePathConfirmInputBox": true,
}
```

### Trailing Spaces

[Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces)
has simply been configured to only automatically trim trailing whitespace from
modified lines, to prevent it from causing unnecessary churn when opening large
documents:

```json
{
  "trailing-spaces.deleteModifiedLinesOnly": true
}
```

### Code Spell Checker

[Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
has been configured to use `en-GB` by default:

```json
{
  "cSpell.language": "en-GB",
}
```

You can easily change this to your preferred locale through the extension
settings.

### Markdown All in One

[Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
is a great quality-of-life extension when maintaining Markdown documents. In
this case it's simply configured to only generate Table of Contents (ToC)
entries for levels 2 to 6, as I find it more useful than having the document
heading displayed in the ToC:

```json
{
  "markdown.extension.toc.levels": "2..6",
}
```

### Editor Settings

I've also added a couple of settings to the workspace for the editor itself:

```jsonc
{
  // Use independent color pools for each bracket type to improve readability.
  "editor.bracketPairColorization.independentColorPoolPerBracketType": true,
  // Display vertical rulers at columns 80 and 100 to help maintain line length.
  "editor.rulers": [
    80,
    100
  ],
  // Wrap text at the specified word wrap column for better display formatting.
  "editor.wordWrap": "wordWrapColumn",
}
```

These are just visual features within the editor, but I particularly like the
rulers as I prefer to keep all documents to a line length of 80 characters where
possible.

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

- `release`: Changes in preparation for release, i.e. version bumps.
- `config`: Changes to configuration files used by the CI system.
- `figures`: Addition or changes to figures included in the document.

## Document Revision History

The LaTeX document contains a section for the revision history. Although a
`CHANGELOG` will be generated based off of the commit history when the document
is released, it can often be beneficial to keep a revision summary within the
document itself, so that it can be tracked even when printed.

This revision history **must** be manually edited in
[./front_matter/document_revision.tex](./front_matter/document_revision.tex),
using initials defined in [./preamble/authors.tex](./preamble/authors.tex). This
must be done as the last commit before each release, and the user should add a
short summary of the revision.

This should be done using a `chore(release):` commit.
