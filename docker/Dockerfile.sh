#!/usr/bin/env bash

set -eux
pushd docker
./Dockerfile.py -v --arch="${ARCH}" --hub_tag="${ARCH_IMAGE}"
popd

# TODO: Add junitxml output and have circleci consume it
# 2 parallel max b/c race condition with docker fixture (I think?)
py.test -vv -n 2 -k "${ARCH}" ./test/
