# fcgwork

This repository gives code with Tokyo Tech NLP Group submission to the [GenChal 2022 Feedback Comment Generation Task](https://fcg.sharedtask.org/).

If you want to use these scripts to run experiments, please install [shotakoyama:fcgtools](https://github.com/shotakoyama/fcgtools).

## How to use

1. Please put GenChal 2022 corpora under `corpora`.

2. Please preproc by running `preproc.sh` under `preproc`.

3. Please run experiments by running scripts under `train`.

## scores

| model | pre/postproc | avg | max | std | misc | 
| --- | --- | --- | --- | --- | --- |
| gpt2-small      |             | 49.45 | 50.09 | 0.48 |  |
| gpt2-small      | filter      | 49.97 | 50.71 | 0.59 |  |
| gpt2-small      | m2          | 50.23 | 51.57 | 0.80 |  |
| gpt2-small      | m2 + filter | 50.71 | 52.56 | 1.05 |  |
| gpt2-small-tag  |             | 50.70 | 51.69 | 0.62 |  |
| gpt2-small-tag  | filter      | 51.14 | 51.79 | 0.42 |  |
| gpt2-small-tag  | m2          | 51.80 | 52.84 | 0.70 |  |
| gpt2-small-tag  | m2 + filter | 52.44 | 53.19 | 0.65 |  |
| gpt2-medium     |             | 48.26 | 49.45 | 0.67 |  |
| gpt2-medium     | filter      | 48.86 | 49.96 | 0.71 |  |
| gpt2-medium     | m2          | 48.03 | 49.94 | 1.16 |  |
| gpt2-medium     | m2 + filter | 48.79 | 50.81 | 1.34 |  |
| gpt2-medium-tag |             | 41.78 | 43.10 | 0.95 |  |
| gpt2-medium-tag | filter      | 41.99 | 43.43 | 1.02 |  |
| gpt2-medium-tag | m2          | 41.10 | 42.47 | 0.80 |  |
| gpt2-medium-tag | m2 + filter | 41.41 | 42.98 | 0.93 |  |
| gpt2-large      |             | 44.94 | 52.36 | 8.25 | Some models fail. |
| gpt2-large      | filter      | 45.31 | 52.95 | 8.32 |  |
| gpt2-large      | m2          | 45.14 | 51.68 | 7.93 |  |
| gpt2-large      | m2 + filter | 45.43 | 52.15 | 8.11 |  |
| gpt2-large-tag  |             | 51.47 | 54.00 | 1.28 |  |
| gpt2-large-tag  | filter      | 52.09 | 54.73 | 1.30 | Submission is of max model. |
| gpt2-large-tag  | m2          | 51.66 | 53.96 | 1.29 |  |
| gpt2-large-tag  | m2 + filter | 51.98 | 54.33 | 1.13 |  |
| bart-small      |             | 47.74 | 48.72 | 0.72 |  |
| bart-small      | filter      | 47.57 | 48.51 | 0.60 |  |
| bart-small      | m2          | 47.36 | 48.07 | 0.74 |  |
| bart-small      | m2 + filter | 47.37 | 48.09 | 0.74 |  |
| bart-small-tag  |             | 47.58 | 48.12 | 0.34 |  |
| bart-small-tag  | filter      | 47.40 | 47.88 | 0.31 |  |
| bart-small-tag  | m2          | 47.32 | 48.03 | 0.49 |  |
| bart-small-tag  | m2 + filter | 47.17 | 47.62 | 0.36 |  |
| bart-large      |             | 47.70 | 48.22 | 0.42 |  |
| bart-large      | filter      | 47.48 | 48.40 | 0.58 |  |
| bart-large      | m2          | 47.45 | 48.09 | 0.38 |  |
| bart-large      | m2 + filter | 47.13 | 47.65 | 0.43 |  |
| bart-large-tag  |             | 47.70 | 49.13 | 1.07 |  |
| bart-large-tag  | filter      | 47.37 | 49.07 | 0.95 |  |
| bart-large-tag  | m2          | 47.67 | 49.15 | 1.23 |  |
| bart-large-tag  | m2 + filter | 47.56 | 49.33 | 1.24 |  |

The score is calculated by `fcg-score` command, and not by the official scorer.
I checked several examples and that `fcg-score` and the official scorer calculate the same score for the same input.

