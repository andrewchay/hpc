#!/bin/bash

dir=`pwd`
cd $dir

for((i=1; i<=20; i++))
do
qsub -l nodes=1:ppn=2 -j oe -N example.$i << EOF
cd $dir

R CMD BATCH --no-save --no-restore "--args idx=$i" example.R example.$i.out

EOF
done

###################
# This is a script that submit multiple jobs to louise to run an R script: example.R
# nodes=1 : Request 1 computing node
# ppn=2 :   Request 2 cores(processors) per node. If I remember it correctly, each processor is accompanied with 8Gb memory.
# -N	:   The name of your job
# idx=$i:   This is how I pass argument into example.R. When I need to repeat the simulation multiple times, I usually use this to control the random number seed.
# example.$i.out:   This gives you what are supposed to be printed on the screen by R
###################
