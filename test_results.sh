#!/bin/bash

# $1 test_sentences.txt
# $2 transducer.fst

./test_intera.sh $1 $2 > output.txt

cut -f 1 files/NLSPARQL.test.data > results/1_token_col.txt
cut -f 2 files/NLSPARQL.test.feats.txt > results/2_postag.txt
cut -f 2 files/NLSPARQL.test.data > results/3_real.txt
cat output.txt | tr ' ' '\n' | sed "s/^O-([a-z]*|'s)/O/g" > results/4_myres.txt

paste results/1_token_col.txt results/2_postag.txt results/3_real.txt results/4_myres.txt | tr '\t' ' ' > results/results.txt

rm output.txt out.txt final.fsa tmp.fst
rm results/1_token_col.txt results/2_postag.txt results/3_real.txt results/4_myres.txt
