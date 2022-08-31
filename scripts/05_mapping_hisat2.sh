#!/usr/bin/env bash

# This script aligns reads to the reference genome
# Dependencies: hisat2

varieties='Rosecoco Canadian Pinto'

mkdir -pv ../alignment/Rosecoco
mkdir -pv ../alignment/Canadian
mkdir -pv ../alignment/Pinto

for variety in $varieties
 do
  fastqs=`ls ../clean_fastqs/$variety`
  for fastq in $fastqs
   do
    samplename=`basename -s '.trimmed.fastq' ../clean_fastqs/$variety/$fastq`
    hisat2 -p 16 -x ../alignment/GCF_000499845.1_PhaVulg1_0_genomic.fna.idx -U ../clean_fastqs/$variety/$fastq -S ../alignment/$variety/$samplename.sam
   done
 done
