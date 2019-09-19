#!/bin/sh

# request Bourne shell as shell for job
#$ -S /bin/sh

# The name of the job, can be anything, simply used when displaying the list of running jobs
#$ -N mcce

# assume current working directory as paths
#$ -cwd

# Giving the name of the output log file
#$ -o run.log

# log of running errors
#$ -e error.log

# Now comes the commands to be executed
#/home/cai/mcce3.5_enum_ms/mcce 
../../Stable-MCCE/bin/mcce
