#!/bin/bash
set -eu

GIT_USER_NAME=${1}
GIT_USER_EMAIL=${2}
PACKAGE_MANAGER=${3}

npx npm-check-updates -u

if [ "${PACKAGE_MANAGER}" == 'npm' ]; then
  npm i --package-lock-only
elif [ "${PACKAGE_MANAGER}" == 'yarn' ]; then
  yarn upgrade
else
  echo "Invalid package manager '${PACKAGE_MANAGER}'. Please set 'package-manager' to either 'npm' or 'yarn'."
  exit 1
fi



if $(git diff-index --quiet HEAD); then
  echo 'No dependencies needed to be updated!'
  exit 0
fi

DESCRIPTION="chore: update deps ($(date -I))"
PR_BRANCH=chore/deps-$(date +%s)

git config user.name ${GIT_USER_NAME}
git config user.email ${GIT_USER_EMAIL}
git checkout -b ${PR_BRANCH}
git commit -am "${DESCRIPTION}"
git push origin ${PR_BRANCH}

curl -fsSL https://github.com/github/hub/raw/master/script/get | bash -s 2.14.1
bin/hub pull-request -m "${DESCRIPTION}"
