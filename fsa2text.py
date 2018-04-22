#!/usr/bin/python
#Create strings from linear fsa

import sys
import re

strings = sys.stdin.readlines()
res = ""

if sys.argv[1] == '-word':	
	for line in strings:
		if len(line.split()) > 2:
			res += line.split()[2] + " "

elif sys.argv[1] == '-char':
	for line in strings:
		if len(line.split()) > 2:
			res += line.split()[2] + " "

	res = "".join(res.split())
	res = re.sub('<[A-Za-z ]+>',' ',res)

print res
