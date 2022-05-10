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
    ../../../preproc/gpt2 \
    --arch large \
    --checkpoint checkpoints/5.pt \
    > feedback/5.txt

fcg-generate \
    gpt2 \
    ../../../preproc/gpt2-applym2 \
    --arch large \
    --checkpoint checkpoints/5.pt \
    > feedback/applym2.5.txt

