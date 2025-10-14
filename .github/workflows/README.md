# GitHub Workflows

This directory contains the GitHub workflows for this template. Each workflow
and any supporting files will be documented here.

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

## [Pull Request](./pull-request.yml)

This workflow simply monitors the commits in a PR, and checks whether they can
be fast-forwarded. This is paired with the [fast forward](#fast-forward)
workflow.

This workflow is optional, and you can remove this workflow along with the
[fast forward](#fast-forward) workflow to use GitHub's default merge strategies.
