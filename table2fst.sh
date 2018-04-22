#!/bin/bash
# 1. input file
# 2. symbol table
# 3. output txt
# 4. acceptor?

if [ $4 = "-acceptor" ]; then
	fstprint --osymbols=$2 --isymbols=$2 $1 > $3
else
	fstprint --acceptor --isymbols=$2 $1 > $3
fi