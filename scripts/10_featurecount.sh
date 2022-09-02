#!/usr/bin/env bash

# This script generates the count matrix from sequence reads per sample
# Dependencies: featureCounts

cpus=4

#Download and unzip gtf file
wget -P ../  https://ftp.ncbi.nlm.nih.gov/genomes/refseq/plant/Phaseolus_vulgaris/latest_assembly_versions/GCF_000499845.1_PhaVulg1_0/GCF_000499845.1_PhaVulg1_0_genomic.gtf.gz
gunzip ../GCF_000499845.1_PhaVulg1_0_genomic.gtf.gz


# Create a directory to save the counts
mkdir -pv ../feature_Counts/{Rosecoco,Canadian,Pinto}

#Generate counts
varieties='Rosecoco Canadian Pinto'
for variety in $varieties
 do
  for fastq in `ls ../alignment/$variety/*.sorted.bam`
   do
    samplename=`basename -s '.sorted.bam' $fastq`
    featureCounts -T $cpus -a ../GCF_000499845.1_PhaVulg1_0_genomic.gtf -o ../feature_Counts/$variety/$samplename.counts.txt $fastq 
   done
 done
