#!/bin/bash

fcg-preproc gpt2 \
    --valid ../genchal22/valid_applym2.tsv \
    --test ../genchal22/test_applym2.tsv \
    --source-detokenize \
    --target-with-initial-space \
    --raw

