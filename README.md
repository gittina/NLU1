This repository contains 3 folder:

* results: it contains the results.txt file, which is given as input to the conlleval.pl perl script.

* evaluation: it contains text files obtained as output from the evaluation perl script, with Fscore, precision, recall indexes.

* files: this is the folder which contains the text files necessary to the project, such as the NLSPARQL train and test set, and the features test files. 

Other additional text files are also included:
- trainO.txt: different version of the training set, organized in two columns as the original one. The second column contains the IOB tags, but O tags are substituted with O-token, in order to let this file suitable to the improvement phase.
- test_sentences.txt: the test set with the content rewritten in order to have a sentence per line
- train_sentences.txt: the train set with the content rewritten in order to have a sentence per line

The module can be run by calling the nlu.sh script. It needs 3 parameters as input: 
1. a number from 1 to 5
2. a string (one among: absolute, kneser_ney, katz, presmoothed, unsmoothed, witten_bell)
3. a text file, e.g. "evaluation/wb2.txt", necessary to save the results on a text file in the evaluation folder

So, an example of execution can be:
```
./nlu.sh 2 witten_bell evaluation/wb2.txt 
```

which calls the scripts necessary to the train and test phase, respectively train.sh and test_results.sh. After that, the perl script for the evaluation is called and the result text file can be found in the evaluation folder, for consultations.

