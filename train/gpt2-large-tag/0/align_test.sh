#!/bin/bash

set -ex

REF="../../../corpora/test/TEST.prep_feedback_comment.public.tsv"

fcg-filter -r $REF -y feedback/test.txt > feedback/test.filtered.txt
paste $REF feedback/test.filtered.txt > submission.tsv

