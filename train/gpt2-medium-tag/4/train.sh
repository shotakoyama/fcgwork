#!/bin/bash

if test -z "${WORKDIR}" ; then
    WORKDIR=$(readlink -f $(dirname $0))
fi
cd $WORKDIR

if test -n "${IS_SGE}" ; then
    . /etc/profile.d/modules.sh
    . ../../../../start.sh
fi

fcg-train \
    gpt2 \
    ../../../preproc/gpt2-tag \
    --arch medium \
    --epochs 100 \
    --max-tokens 500 \
    --lr 0.0001 \
    --weight-decay 0.01 \
    --step-interval 16 \
    --save-interval 5 \
    | tee train.log

