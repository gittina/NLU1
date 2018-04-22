#!/usr/bin/env python3
import sys

if len(sys.argv) < 1:
	print("not enough args")
	exit()

input_file = open(sys.argv[1])

for line in input_file:
	line = line.split()

	if len(line) == 2:
		label = line[1]
		word = line[0]

		if label=='O':
			print("%s\tO-%s" % (word, word))
		else:
			print("%s\t%s" % (word, label))
	else:
		print(" ")