#!/bin/bash

sqPBS.py gen 10.2 Sequencing sim taskslist > run.pbs
# gen4 / gen specifies the queue. gen is the general queue which has 8 nodes. gen4 has 4 nodes. As you may imagine, 8 nodes ones are more popular hence the waiting time can be longer.
# 5.2 tells us use 5 nodes on louise and on each nodes, use 2 processors.
# Sequencing is the Account name, sim is the job title specified by me.
# The final command will be redirected to a file called 'run.pbs' rather than the stdio.