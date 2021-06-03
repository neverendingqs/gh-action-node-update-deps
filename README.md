# gh-action-node-update-deps

Updates Node dependencies and creates a pull request with the changes.

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
      - uses: actions/checkout@v2
      - uses: neverendingqs/gh-action-node-update-deps@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          bump-version: patch                 # defaults to not bumping the package version
          commit-message-prefix: fix          # defaults 'chore''
          package-manager: yarn               # defaults to 'npm'
          git-user-email: myemail@example.com # defaults to '41898282+github-actions[bot]@users.noreply.github.com'
          git-user-name: Test                 # defaults to 'github-actions[bot]'
          pre-commit-script: npm run build    # defaults to not running anything
          pull-request-labels: test           # defaults to 'dependencies'
          target-version: minor               # defaults to 'latest'
```
