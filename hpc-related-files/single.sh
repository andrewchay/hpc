#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=100:00:00
#PBS -j oe
dir=`pwd`
cd $dir


qsub Rscript --vanilla dataGeneration-multi.R 