# GitHub Workflows

This directory contains the GitHub workflows for this template. Each workflow
and any supporting files will be documented here.

### [Build LaTeX](./build-latex.yml)

[build-latex.yml](./build-latex.yml) is a reusable workflow that can be used to
build a LaTeX document, and upload the resulting PDF as an artifact.

### [Build Release](./build-release.yml)

[build-release.yml](./build-release.yml) contains the main build workflow for
this repo. It will:

- Automatically generate a changelog and bump the version number, based on new
  conventional commits.
- Build the LaTeX document using [build-latex.yml](./build-latex.yml).
- Create a new Release on GitHub, uploading the document `.pdf` and changelog.

This will happen whenever any changes are pushed to `main`, which _should_ be
through PR's!

Note that the document name is derived from the repo name by default. To change
this, edit the following line:

```yaml
DOCUMENT_BASE_NAME: ${{ github.event.repository.name }}
```

### [Create From Template](./create-from-template.yml)

[create-from-template.yml](./create-from-template.yml) is designed to run only
once, when a new repository is created from the template. On the first `push`
event to a non-template repository, it will checkout the repo, delete itself,
and amend the initial commit to conform to the
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0)
specification.

> [!TIP]
> Remove this section after creating your repo from this template, as the
> workflow will be deleted.

### [Fast Forward](./fast-forward.yml)

A workflow that allows using the `/fast-forward` command to complete a PR, and
merge it with the `git merge --ff-only` strategy. This is paired with the
[pull request](#pull-request) workflow.

GitHub's default "Rebase and Merge" strategy modifies the commits that it
rebases, which will negate things like GPG-signed commits. This workflow allows
a fast-forward merge to be performed instead.

This workflow is completely optional, and is only used to suit my preferred
`git` routine. You can simply remove this workflow along with the
[pull request](#pull-request) workflow to use GitHub's default merge strategies.

To use this workflow, you will need to either set up a
[personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
and add the token name to the following line of the workflow, or remove the
following line entirely:

```yaml
github_token: ${{ secrets.FF_PAT }}
```

Replacing `FF_PAT` with the name of your access token.

> [!TIP]
> Unless you use a
> [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens),
> this workflow will not be able to trigger other workflows when merging.

### [Lint Commits](./lint-commits.yml)

[lint-commits.yml](./lint-commits.yml) uses [git-cliff](https://git-cliff.org/)
to lint all commits in the repo with every PR, ensuring that they conform to the
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0)
specification. It also checks the document revision, to ensure that each PR
correctly updates the document revision to reflect the prospective version bump
based on the commits in the PR.

The main [cliff.toml](../../cliff.toml) is used as the configuration file to
configure `git-cliff`, which should require conventional commits for this
workflow to function correctly.

## [Pull Request](./pull-request.yml)

This workflow simply monitors the commits in a PR, and checks whether they can
be fast-forwarded. This is paired with the [fast forward](#fast-forward)
workflow.

This workflow is optional, and you can remove this workflow along with the
[fast forward](#fast-forward) workflow to use GitHub's default merge strategies.
