#!/usr/bin/env bash

#This script indexes the sorted bam files 
#Dependencies:samtools

varieties='Rosecoco Canadian Pinto'
for variety in $varieties
 do
  for fastq in `ls ../alignment/$variety/*.sorted.bam`
   do
    samtools index -b $fastq 
   done
 done
