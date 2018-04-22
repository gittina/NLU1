#!/bin/bash
# $1 trainO.txt
# $2 frasi_train.txt
# $3 ngram order
# $4 method

ngramsymbols < $1 > lex.syms

./calc_probab_edges.py $1 > tmp.txt
./fst2table.sh tmp.txt lex.syms automa.fst
fstarcsort --sort_type=olabel automa.fst transducer.fst

echo "Number of edges: $(fstprint transducer.fst | wc -l)"

rm tmp.txt automa.fst

farcompilestrings --symbols=lex.syms --unknown_symbol='<unk>' $2 > data.far
ngramcount --order=$3 --require_symbols=false data.far > pos.cnt
ngrammake --method=$4 pos.cnt > pos.lm
rm data.far
