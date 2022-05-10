#!/bin/bash

fcg-preproc bart \
    --valid ../genchal22/valid_applym2.tsv \
    --test ../genchal22/test_applym2.tsv \
    --add-gector-tag \
    --valid-tag ../genchal22/valid_applym2_gector_tag.txt \
    --test-tag ../genchal22/test_applym2_gector_tag.txt \
    --source-detokenize \
    --raw

