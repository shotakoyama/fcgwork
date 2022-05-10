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

for N in $(seq 10 5 100) ; do
    fcg-generate \
        gpt2 \
        ../../../preproc/gpt2 \
        --arch medium \
        --checkpoint checkpoints/$N.pt \
    > feedback/$N.txt
done

