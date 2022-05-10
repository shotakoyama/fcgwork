# genchal22 data preprocessing

1. `bash prepare.sh`

Make TSV file for inputs.

2. prepare M2

Run GECToR for GEC, and make ERRANT M2 file.

```
train.m2
valid.m2
test.m2
```

3. `bash applym2.sh`

apply M2 to tsv

4. make GECToR tag files

