#!/usr/bin/env bash

#This scripts sorts the bam files
#Dependencies:samtools

varieties='Rosecoco Canadian Pinto'
for variety in $varieties
 do
  for fastq in `ls ../alignment/$variety/*.bam`
   do
    samplename=`basename -s '.bam' $fastq`
    samtools sort -T temp1 -O bam -o ../alignment/$variety/$samplename.sorted.bam $fastq 
   done
 done
