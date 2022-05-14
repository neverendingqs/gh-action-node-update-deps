# gh-action-node-update-deps

Updates Node dependencies and creates a pull request with the changes.
Uses [npm-check-updates](https://www.npmjs.com/package/npm-check-updates) under the hood,
so you can add a `.ncurc` file to fine tune dependency decisions,
such as which ones to ignore.

Note: prefer dependabot over this action **once** [dependabot supports grouped pull requests](https://github.com/dependabot/feedback/issues/5).

## Example usage

```yaml
name: Scheduled dependencies update
on:
  schedule:
    - cron: '0 15 * * 2'
jobs:
  update-deps:
    name: Update Node dependencies
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version-file: .nvmrc
      - uses: neverendingqs/gh-action-node-update-deps@v2
        with:
          bump-version: patch                               # defaults to not bumping the package version
          commit-message-prefix: fix                        # defaults 'chore'
          package-manager: yarn                             # defaults to 'npm'
          github-token: ${{ secrets.CUSTOM_GITHUB_TOKEN }}  # defaults to the repo's `GITHUB_TOKEN`
          git-user-email: myemail@example.com               # defaults to '41898282+github-actions[bot]@users.noreply.github.com'
          git-user-name: Test                               # defaults to 'github-actions[bot]'
          pre-commit-script: npm run build                  # defaults to not running anything
          pull-request-labels: test                         # defaults to 'dependencies'
          target-version: minor                             # defaults to 'latest'
```

## FAQ

### Why doesn't the resulting pull request not trigger any GitHub Action workflows?

That is [by design when using the repository's `GITHUB_TOKEN`](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow).
You can circumvent this by creating a [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) or a [installation access token](https://docs.github.com/en/developers/apps/building-github-apps/authenticating-with-github-apps#authenticating-as-an-installation).
**Note that doing so exposes you to vulnerabilities described on [Keeping your GitHub Actions and workflows secure Part 1: Preventing pwn requests](https://securitylab.github.com/research/github-actions-preventing-pwn-requests/).**
