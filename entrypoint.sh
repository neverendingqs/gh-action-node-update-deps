#!/bin/bash
set -eu

npx npm-check-updates -u
npm i --package-lock-only

if $(git diff-index --quiet HEAD); then
  echo 'No dependencies needed to be updated!'
  exit 0
fi

PR_BRANCH=chore/deps-$(date +%s)
DESCRIPTION="chore: update deps (automated)"

git config user.name ${1}
git config user.email ${2}
git checkout -b ${PR_BRANCH}
git commit -am "${DESCRIPTION}"
git push origin ${PR_BRANCH}

curl -fsSL https://github.com/github/hub/raw/master/script/get | bash -s 2.14.1
bin/hub pull-request -m "${DESCRIPTION}"
