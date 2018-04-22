#!/usr/bin/env python3
import sys
import numpy as np

if len(sys.argv) < 1:
	print("not enough args")
	exit()

input_file = open(sys.argv[1])

c_wi_ti = {}
c_ti = {}

p_wi_ti = {}

# create counts
for line in input_file:
	line = line.split()

	if len(line) == 2:
		label = line[1]
		word = line[0]

		if label not in c_ti:
			c_ti[label] = 1
		else:
			c_ti[label] = c_ti[label] + 1

		if label not in c_wi_ti:
			c_wi_ti[label] = {}
		if word in c_wi_ti[label]:
			c_wi_ti[label][word] = c_wi_ti[label][word] + 1
		else:
			c_wi_ti[label][word] = 1

#print(c_wi_ti['O'])
#print('\n')
#print(c_wi_ti['B-character.name'])
#print('\n')
#print(c_wi_ti['B-movie.name'])
#print('\n')
#print(c_wi_ti['I-movie.name'])

#print('\n')

#print(len(c_wi_ti.keys()))

# create probab P(wi|ti)
for label in c_wi_ti:
	p_wi_ti[label] = {}
	for word in c_wi_ti[label]:
		p_wi_ti[label][word] = c_wi_ti[label][word] / c_ti[label]

#print(c_ti['O'])

for l in p_wi_ti:
	for w in p_wi_ti[l]:
		probab = -np.log(p_wi_ti[l][w])		
		print("0\t0\t%s\t%s\t%f" % (w,l,probab))

for l in c_ti:
	print("0\t0\t%s\t%s\t%f" % ('<unk>',l,(1/len(c_ti))))

print("0")
