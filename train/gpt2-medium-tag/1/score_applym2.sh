#!/bin/bash

set -ex

REF="../../../corpora/train_dev/DEV.prep_feedback_comment.public.tsv"

echo -n > result_applym2.tsv
echo -n > result_applym2.filtered.tsv

for N in $(seq 10 5 100) ; do

    fcg-score -r $REF -y feedback/applym2.$N.txt \
        | xargs printf "%d\t%.2f\n" $N \
        >> result_applym2.tsv

    fcg-filter -r $REF -y feedback/applym2.$N.txt \
        > feedback/applym2.$N.filtered.txt

    fcg-score -r $REF -y feedback/applym2.$N.filtered.txt \
        | xargs printf "%d\t%.2f\n" $N \
        >> result_applym2.filtered.tsv

done

