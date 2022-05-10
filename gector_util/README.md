# gector util

These scripts are used to apply M2 file and generate GECToR tag for preprocess data.

## `procm2.py`

This command applies M2 file.
This scripts apply correction edits to the source erroneous sentences.
Note that edits around word or phrase to generate feedback comment, are not corrected by this script.

First, please use GECToR (RoBERTa) model to the erroneous sentences of feedback comment dataset, and get the corrected sentences.
Second, make M2 file using `errant 2.3.3` from erroneous sentence to corrected sentence.
Finally, run `python procm2.py -t (feedback comment tsv) -m (M2 file)`, and get processed M2.

I recommend you to use `errant 2.3.3`, not other versions.

## `predict_tag.py`

Please this script under GECToR repository and run it.
Note that you have to use GPU to run this script.

```
python predict_tag.py < (processed tsv) > (GECToR prediction)
```

## `extract_tag.py`

This script converts GECToR predictions which `predict_tag.py` generates, to GECToR tag file.

```
python extract_tag.py < (GECToR prediction) > (tag list file)
```

Please put them below under `fcgwork/preproc/genchal22` to run `fcgwork/preproc/{bart,bart-applym2,gpt2,gpt2-applym2}-tag/preproc.sh`.

```
train_gector_tag.txt
valid_gector_tag.txt
test_gector_tag.txt
```

