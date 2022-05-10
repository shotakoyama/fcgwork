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
    bart \
    ../../../preproc/bart-tag \
    --epochs 100 \
    --max-tokens 2000 \
    --lr 0.0001 \
    --weight-decay 0.01 \
    --step-interval 4 \
    --save-interval 5 \
    | tee train.log

