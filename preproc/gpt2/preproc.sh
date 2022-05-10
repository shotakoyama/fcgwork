#!/bin/bash

fcg-preproc gpt2 \
    --train ../genchal22/train.tsv \
    --valid ../genchal22/valid.tsv \
    --test ../genchal22/test.tsv \
    --source-detokenize \
    --target-with-initial-space \
    --raw

