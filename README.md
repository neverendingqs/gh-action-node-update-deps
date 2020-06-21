# gh-action-node-update-deps

Updates npm dependencies, bumps patch version, and creates a pull request with the changes.

## Example usage

```yaml
uses: neverendingqs/gh-action-node-update-deps@v1
with:
  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
