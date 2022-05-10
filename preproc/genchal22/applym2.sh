#!/bin/bash

set -ex

fcg-apply-m2 -t valid.tsv -m valid.m2 > valid_applym2.tsv
fcg-apply-m2 -t test.tsv -m test.m2 > test_applym2.tsv

