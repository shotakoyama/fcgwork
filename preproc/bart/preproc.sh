#!/bin/bash

fcg-preproc bart \
    --train ../genchal22/train.tsv \
    --valid ../genchal22/valid.tsv \
    --test ../genchal22/test.tsv \
    --source-detokenize \
    --raw

