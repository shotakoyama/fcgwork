import sys

def choose_tag(tags):
    for tag in tags:
        index, label, label_prob, tag_prob = tag.split('\t')
        if label not in {'$KEEP', '@@UNKNOWN@@'}:
            return label
    assert False


rules = {
        'TRANSFORM_AGREEMENT_PLURAL': 'plural',
        'TRANSFORM_AGREEMENT_SINGULAR': 'singular',
        'TRANSFORM_CASE_CAPITAL': 'titlecase',
        'TRANSFORM_CASE_CAPITAL_1': 'capitalcase', # ???
        'TRANSFORM_CASE_LOWER': 'lowercase',
        'TRANSFORM_CASE_UPPER': 'uppercase',
        'TRANSFORM_SPLIT_HYPHEN': 'split hyphen'}


def proc_tag(tag):
    assert tag[0] == '$'
    tag = tag[1:]

    if tag == 'DELETE':

        tag = 'delete'

    elif tag.startswith('REPLACE_'):

        lst = tag.split('_')
        assert len(lst) == 2
        tag = 'replace {}'.format(lst[1])

    elif tag.startswith('APPEND_'):

        lst = tag.split('_')
        assert len(lst) == 2
        tag = 'add {}'.format(lst[1])

    elif tag in rules:

        tag = rules[tag]

    elif tag.startswith('TRANSFORM_VERB'):

        lst = tag.split('_')
        assert len(lst) == 4
        tag = 'from {} to {}'.format(lst[2], lst[3])

    else:

        assert False

    return tag


def main():
    for sent in sys.stdin.read().strip().split('\n\n'):
        sent = sent.split('\n')
        tags = sent[1:]

        tag = choose_tag(tags)
        tag = proc_tag(tag)
        print(tag)


if __name__ == '__main__':
    main()

