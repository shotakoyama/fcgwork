from gector.gec_model import GecBERTModel
import sys
import torch
from allennlp.nn import util


with open('data/output_vocabulary/labels.txt') as f:
    label_list = [x.strip() for x in f]

with open('data/output_vocabulary/d_tags.txt') as f:
    d_tag_list = [x.strip() for x in f]


def get_cands(label_probs, d_tag_probs, span):
    cands = [
        (token_index, label, d_tag_probs[token_index][1], label_probs[token_index][label_index])
        for token_index
        in span
        for label_index, label
        in enumerate(label_list)]
    cands.sort(key = lambda x: -x[-1])
    return cands



def inference(gecmodel, sent, span):
    batches = gecmodel.preprocess([sent.split()])

    for batch, model in zip(batches, gecmodel.models):
        batch = util.move_to_device(batch.as_tensor_dict(), 0 if torch.cuda.is_available() else -1)
        with torch.no_grad():
            prediction = model.forward(**batch)
        label_probs = prediction['class_probabilities_labels'][0]
        d_tag_probs = prediction['class_probabilities_d_tags'][0]

        cands = get_cands(label_probs, d_tag_probs, span)

        for token_index, label, d_tag_prob, span_prob in cands[:20]:
            print('{}\t{}\t{}\t{}'.format(token_index, label, span_prob, d_tag_prob))
        print()


def main():

    data = []
    for line in sys.stdin:
        tup = line.strip().split('\t')
        if len(tup) == 3:
            source, start, end = tup
            feedback = None
        elif len(tup) == 4:
            source, start, end, feedback = tup
        else:
            assert False
        start, end = int(start), int(end)
        data.append((source, start, end, feedback))

    sent_list = [
        (source, range(start, end))
        for source, start, end, feedback
        in data]

    gecmodel = GecBERTModel(
            vocab_path = 'data/output_vocabulary',
            model_paths = ['roberta_1_gectorv2.th'],
            max_len = 200,
            min_len = 3,
            iterations = 5,
            min_error_probability = 0.5,
            lowercase_tokens = 0,
            model_name = 'roberta',
            special_tokens_fix = 1,
            log = False,
            confidence = 0.2,
            del_confidence = 0.0,
            is_ensemble = 0,
            weigths = None)

    for index, (sent, span) in enumerate(sent_list, start = 1):
        source = '{}\t{}'.format(index, sent)
        print(source)
        print(source, file = sys.stderr)
        inference(gecmodel, sent, [x + 1 for x in span])


if __name__ == '__main__':
    main()

