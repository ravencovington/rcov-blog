#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eaa12e7e6eaf70014e17df2/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eaa12e7e6eaf70014e17df2
curl -s -X POST https://api.stackbit.com/project/5eaa12e7e6eaf70014e17df2/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5eaa12e7e6eaf70014e17df2/webhook/build/publish > /dev/null
