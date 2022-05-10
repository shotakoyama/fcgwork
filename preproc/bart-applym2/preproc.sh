#!/bin/bash

fcg-preproc bart \
    --valid ../genchal22/valid_applym2.tsv \
    --test ../genchal22/test_applym2.tsv \
    --source-detokenize \
    --raw

