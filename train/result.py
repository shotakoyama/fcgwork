from argparse import ArgumentParser
from pathlib import Path
import numpy as np

def parse_args():
    parser = ArgumentParser()
    parser.add_argument('base')
    return parser.parse_args()


def read_max_score(result):
    data = []
    with open(result) as f:
        for line in f:
            tup = line.strip().split('\t')
            epoch = int(tup[0])
            score = float(tup[1])
            data.append((epoch, score))
    max_score = max(data, key = lambda x: x[1])
    return max_score


def show_avg(score_list):
    score_avg = np.average([score for _, score in score_list])
    score_std = np.std([score for _, score in score_list])
    index_max, epoch_max, score_max = max([(index, epoch, score) for index, (epoch, score) in enumerate(score_list)], key = lambda x: x[-1])
    line = '{}\t{}\t{:.2f}\t{:.2f}\t{:.2f}'.format(
            index_max,
            epoch_max,
            score_max,
            score_avg,
            score_std)
    print(line)


def main():
    args = parse_args()

    base = Path(args.base)
    tsv_list = ['result.tsv', 'result.filtered.tsv', 'result_applym2.tsv', 'result_applym2.filtered.tsv']

    for tsv_name in tsv_list:
        index_list = [index for index in range(5)]
        result_list = [base / str(index) / tsv_name for index in index_list]
        score_list = [read_max_score(result) for result in result_list]
        show_avg(score_list)


if __name__ == '__main__':
    main()

