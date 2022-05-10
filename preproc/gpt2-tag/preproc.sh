#!/bin/bash

fcg-preproc gpt2 \
    --train ../genchal22/train.tsv \
    --valid ../genchal22/valid.tsv \
    --test ../genchal22/test.tsv \
    --add-gector-tag \
    --train-tag ../genchal22/train_gector_tag.txt \
    --valid-tag ../genchal22/valid_gector_tag.txt \
    --test-tag ../genchal22/test_gector_tag.txt \
    --source-detokenize \
    --target-with-initial-space \
    --raw

