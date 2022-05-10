#!/bin/bash

REF="../../../corpora/train_dev/DEV.prep_feedback_comment.public.tsv"

set -ex

echo -n > result.tsv
echo -n > result.filtered.tsv

for N in $(seq 10 5 100) ; do

    fcg-score -r $REF -y feedback/$N.txt \
        | xargs printf "%d\t%.2f\n" $N \
        >> result.tsv

    fcg-filter -r $REF -y feedback/$N.txt \
        > feedback/$N.filtered.txt

    fcg-score -r $REF -y feedback/$N.filtered.txt \
        | xargs printf "%d\t%.2f\n" $N \
        >> result.filtered.tsv

done

