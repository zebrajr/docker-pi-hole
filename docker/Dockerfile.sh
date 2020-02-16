#!/usr/bin/env bash
set -eux

# Build
pushd docker
./Dockerfile.py -v --arch="${ARCH}" --hub_tag="${ARCH_IMAGE}"
popd

# Test
## TODO: Add junitxml output and have circleci consume it
py.test -vv -n auto -k "${ARCH}" ./test/
