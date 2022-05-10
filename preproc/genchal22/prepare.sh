#!/bin/bash

set -ex

fcg-prepare \
    --train ../../corpora/train_dev/TRAIN.prep_feedback_comment.public.tsv \
    --valid ../../corpora/train_dev/DEV.prep_feedback_comment.public.tsv \
    --test ../../corpora/test/TEST.prep_feedback_comment.public.tsv

