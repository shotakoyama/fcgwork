#!/bin/bash

if test -z "${WORKDIR}" ; then
    WORKDIR=$(readlink -f $(dirname $0))
fi
cd $WORKDIR

if test -n "${IS_SGE}" ; then
    . /etc/profile.d/modules.sh
    . ../../../../start.sh
fi

set -ex

mkdir -p feedback

fcg-generate \
    gpt2 \
    ../../../preproc/gpt2-tag \
    --arch large \
    --phase test \
    --checkpoint checkpoints/10.pt \
    > feedback/test.txt

