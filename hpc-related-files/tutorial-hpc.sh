#!/bin/bash

#### some notes on how to setup the louise!!!
### first, in order to use R, you need to "load" it or add that into the system PATH. Also, will need SimpleQueue to simplify the submission stage.
export PATH=/usr/local/cluster/software/installation/R/R-3.1.0/bin:$PATH
export PATH=/usr/local/cluster/software/installation/SimpleQueue:$PATH

### 0. Need to have some kind of R function like the one in sim-c.R. It takes one argument which is the jobID. The result should be saved by the jobID respectively.

python tasks-gen.py sim-lsls.R 30
#### This script essentially creates the “taskslist” file, which will be used in simpleQueue when “simQ-call.sh” is run. It takes at most two arguments. The first argument specifies the name of the R file that is going to be called and the second argument specifies the number of jobs to be created. Default for both arguments is (“sim”, 20).

./simQ-call.sh  
#### this will run the bash file simQ-call.sh which uses the simpleQueue to automatically generate the file run.pbs.

qsub run.pbs 
#### have fun.