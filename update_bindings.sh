#!/bin/bash

set -e

WDIR="$(realpath $(dirname $0))"

pushd $(mktemp -d)
    git clone https://git.mrcyjanek.net/mrcyjanek/monero_c .
    git checkout b739dd6b51440905d3a6a6095c79d5ab3d40069a
    # git submodule update --init --force
    # ./apply_patches.sh wownero
    # ./apply_patches.sh monero
    cp wownero_libwallet2_api_c/src/main/cpp/wallet2_api_c.h $WDIR/wownero_wallet2_api_c.h
    cp monero_libwallet2_api_c/src/main/cpp/wallet2_api_c.h $WDIR/monero_wallet2_api_c.h
popd

dart run ffigen --config ffigen_wownero.yaml
dart run ffigen --config ffigen_monero.yaml