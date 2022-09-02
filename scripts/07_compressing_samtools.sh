#!/usr/bin/env bash

#This scripts converts the sam files to bam files
#Dependencies:samtools

varieties='Rosecoco Canadian Pinto'
for variety in $varieties
 do
  for fastq in `ls ../alignment/$variety/*.sam`
   do
    samplename=`basename -s '.sam' $fastq`
    samtools view -b $fastq -o ../alignment/$variety/$samplename.bam
   done
 done
