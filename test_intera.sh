#!/bin/bash
# $1 test_sentences.txt
# $2 transducer.fst

fstcompose $2 pos.lm > tmp.fst

while read line; do
	echo ${line} | farcompilestrings --symbols=lex.syms --unknown_symbol='<unk>' --generate_keys=1 --keep_symbols | farextract --filename_suffix='.fst'

	fstcompose 1.fst tmp.fst | fstshortestpath | fstrmepsilon | fsttopsort | fstproject --project_output > final.fsa
	#fstprint --isymbols=lex.syms --osymbols=lex.syms final.fsa

	./table2fst.sh final.fsa lex.syms out.txt -acceptor 
	cat out.txt | ./fsa2text.py -word | sed "s/  */\n/g" >> output.txt
	
	echo "$(cat out.txt | ./fsa2text.py -word)"
	
	rm 1.fst
done < $1

