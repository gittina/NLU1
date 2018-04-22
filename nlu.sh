#!/bin/bash
#$1 ngram order
#$2 method
#$3 output file

echo "training phase"
./replaceO.py files/train.data > files/trainO.txt
cat files/trainO.txt | cut -f 2 | sed "s/^ *$/#/g" | tr '\n' ' '| sed "s/#/\n/g" | sed "s/^ *//g;s/ *$//g" > files/train_sentences.txt

./train.sh files/trainO.txt files/train_sentences.txt $1 $2

echo "testing phase"
cat files/NLSPARQL.test.data | cut -f 1 | sed "s/^ *$/#/g" | tr '\n' ' '| sed "s/#/\n/g" | sed "s/^ *//g;s/ *$//g" > files/test_sentences.txt

./test_results.sh files/test_sentences.txt transducer.fst
./conlleval.pl < results/results.txt > $3
rm pos.lm pos.cnt transducer.fst lex.syms