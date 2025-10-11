# LaTeX_Template

A versatile and extensible LaTeX document template designed for version
controlled documents stored as GitHub repos. The use of
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) allows
automatic document versioning, and automatic changelog generation.

This template aims to be as easy to get started with as possible, simply using
this as a template when creating a new GitHub repo will provide GitHub Actions
to lint commits and create versioned releases of the document on GitHub.

After using this repo as a template on GitHub, you may wish to follow the
[repo configuration recommendations](#repository-configuration-recommendations)
to ensure the GitHub actions work correctly.

For more details on how to commit changes to the document after consuming the
template, see [CONTRIBUTING.md](./CONTRIBUTING.md). This document should also be
updated to define the commit [types](./CONTRIBUTING.md#types) and
[scopes](./CONTRIBUTING.md#scopes) that can be used when contributing to your
document.

<!-- omit from toc -->
## Contents

- [Template Structure](#template-structure)
- [Consuming This Template](#consuming-this-template)
- [IDE](#ide)
- [Conventional Commits](#conventional-commits)
- [Repository Configuration Recommendations](#repository-configuration-recommendations)
- [`git-cliff` Configuration](#git-cliff-configuration)
  - [Configure the Repo URL](#configure-the-repo-url)
  - [Commit Parsers](#commit-parsers)
- [License](#license)
  - [What This Means For You](#what-this-means-for-you)

## Template Structure

```text
LaTeX_Template                   # Repo root.
 ├─ .github/                     # GitHub files i.e. workflows, templates, etc.
 ├─ .vscode/                     # VSCode shared workspace files.
 ├─ build/                       # Build output dir for LaTeX Workshop.
 ├─ front_matter/                # .tex files defining the front matter.
 ├─ images/                      # Image files used in figures.
 ├─ preamble/                    # .tex files defining the preamble contents.
 ├─ sections/                    # .tex files defining the main sections.
 ├─ .gitignore                   # .gitignore file.
 ├─ appendices.tex               # Appendices definitions.
 ├─ cliff.toml                   # git-cliff configuration file.
 ├─ CONTRIBUTING.md              # Contribution guidelines.
 ├─ LICENSE                      # MIT License for the template.
 ├─ main.tex                     # Main entry point for the .tex document.
 └─ README.md                    # Main template README (You are here!).
```

All directories that should be modified by contributors contain their own
`README.md` files.

## Consuming This Template

> [!TIP]
> Remove this section after consuming this template and configuring your repo.

After creating a GitHub repo based on this template, there are a few things that
you should configure to ensure that the workflows work correctly, and that the
conventional commit configuration is correct for your document. These are all
described in other sections, but are all linked here for convenience:

<!-- no toc -->
- [Repo Configuration](#repository-configuration-recommendations)
- [Define Conventional Commit Types](./CONTRIBUTING.md#types)
- [Define Conventional Commit Scopes](./CONTRIBUTING.md#scopes)
- [`git-cliff` Configuration](#git-cliff-configuration)
- [Review the LICENSE](#license)

## IDE

This template is designed around the use of
[VSCode](https://code.visualstudio.com/) as an IDE since it is freely available
and relatively easy to use.

To configure [VSCode](https://code.visualstudio.com/) for use with LaTeX, see
the [VSCode Setup section of CONTRIBUTING.md](./CONTRIBUTING.md#vscode-setup).

## Conventional Commits

This template assumes the use of
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) when
maintaining the version-controlled document to allow automatic versioning and
changelog generation. Details of the commit style can be found in the
[contributing guide](./CONTRIBUTING.md).

## Repository Configuration Recommendations

> [!TIP]
> Remove this section after consuming this template and configuring your repo.

In order to ensure that the GitHub Actions work correctly, and that changelogs
are generated correctly for each release, it is recommended to configure your
repository as follows:

- Protect your default branch (i.e. `main`):
  - Restrict updates / block force pushes. This just ensures that everyone
    _must_ PR into `main` unless they have a _very good reason_. You can add the
    repo admin / other users to the bypass list if you must but generally
    updates / force pushing directly to `main` should be avoided for the sake of
    others...
  - Require a pull request before merging. This ensures that the GitHub Action
    that lints the `git` commits will run, ensuring that all commits are
    [conventional](https://www.conventionalcommits.org/en/v1.0.0/) and will
    generate good changelogs.
  - Ensure that "Rebase" is the only allowed merge method for PRs to ensure that
    merge commits aren't included in the changelog.
  - Require status checks to pass. This ensures that the `git` commit linter
    passes before the changes are merged.
  - Require deployments to succeed. This just checks that there are no major
    errors with the new commits (i.e. the document can still be built). The
    contents of the changes should still be checked carefully!
  - Require linear history. There are many advantages to maintaining a linear
    history on the `main` branch. It ensures that the changelog is easily
    translatable to the history, commits can be `cherry-pick`ed more easily onto
    other branches, changes aren't "hidden" inside merge commits etc. This is
    the _most_ optional of the branch protections, but if you're putting the
    effort in to use
    [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
    anyway, you may as well ensure your history is linear while you're at it...
- Consider limiting the pull request merge types globally to enforce a linear
  history everywhere. This ensures that merge commits don't end up in the
  history at all, but requires more knowledge of `git` to manage.
- Enable release immunity to ensure old versions of the document cannot be
  updated.

## `git-cliff` Configuration

> [!TIP]
> Remove this section after consuming this template and configuring your repo.

The [`git-cliff` configuration file](./cliff.toml) has a few **required**
modifications to ensure that it is set up to work for your repo, rather than the
template. These are listed below, but you may wish to make other changes to that
file to suit your versioning strategy.

### Configure the Repo URL

The `<REPO>` URL is specified in the `commit_preprocessors`, and is used to
generate links to issues in the changelog. Ensure that you update the `<REPO>`
definition in the `postprocessors` section so that the links are generated with
the correct URL:

```toml
postprocessors = [
    # Replace the placeholder <REPO> with a URL.
    { pattern = '<REPO>', replace = "https://github.com/YourName/YourRepo" },
]
```

### Commit Parsers

The commit parsers group commits within each release into named "sections".
Ensure that these sections match the types you define in your
[CONTRIBUTING.md document](./CONTRIBUTING.md#types). For example:

```toml
commit_parsers = [
    { message = "^feat", group = "<!-- 0 -->🚀 Features" },
    { message = "^fix", group = "<!-- 1 -->🐛 Fixes" },
    { message = "^docs", group = "<!-- 2 -->📚 Documentation" },
    { message = "^ci", group = "<!-- 3 -->🛠️ CI/CD" },
    { message = "^style", group = "<!-- 4 -->🎨 Styling" },
    { message = "^chore\\(release\\)", skip = true },
    { message = "^chore", group = "<!-- 5 -->⚙️ Miscellaneous Tasks" },
    { message = "^revert", group = "<!-- 6 -->◀️ Revert" },
    { message = ".*", group = "<!-- 7 -->💼 Other" },
]
```

## License

The contents of this repository, including the basic LaTeX template, GitHub
Actions, and basic documentation, are licensed under the
[MIT license](https://mit-license.org/) (see [LICENSE](./LICENSE)).

### What This Means For You

- You may freely use, fork, modify, and redistribute this template, providing
  that you include a copy of the [LICENSE](./LICENSE) file and keep the
  copyright notice intact.
- Any contents (including text, images, code, or other contents) that you add
  is yours alone; no license over that content is granted here.
