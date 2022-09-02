#!/usr/bin/env bash

# This script generates the count matrix from sequence reads per variety
# Dependencies: featureCounts

cpus=4


# Create a directory to save the counts
mkdir -pv ../feature_Counts/{Rosecoco,Canadian,Pinto}

#Generate counts
varieties='Rosecoco Canadian Pinto'
for variety in $varieties
 do
  featureCounts -T $cpus -a ../GCF_000499845.1_PhaVulg1_0_genomic.gtf -o ../feature_Counts/$variety/merged_counts_$variety.txt ../alignment/$variety/*.sorted.bam
 done
