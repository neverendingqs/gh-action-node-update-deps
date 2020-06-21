# gh-action-node-update-deps

Updates npm dependencies, bumps patch version, and creates a pull request with the changes.

## Example usage

```yaml
name: Scheduled dependencies update
on:
  schedule:
    - cron:  '0 15 * * 2'
jobs:
  update-deps:
    name: Update Node dependencies
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - uses: neverendingqs/gh-action-node-update-deps@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          package-manager: yarn   # defaults to 'npm'
```
