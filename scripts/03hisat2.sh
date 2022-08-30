#!/usr/bin/bash

# Download the reference genome

#wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/499/845/GCF_000499845.1_PhaVulg1_0/GCF_000499845.1_PhaVulg1_0_genomic.fna.gz
#gunzip GCF_000499845.1_PhaVulg1_0_genomic.fna.gz

#Build the index file

#mv GCF_000499845.1_PhaVulg1_0_genomic.fna ../alignment/
#hisat2-build -f ../alignment/GCF_000499845.1_PhaVulg1_0_genomic.fna ../alignment/GCF_000499845.1_PhaVulg1_0_genomic.fna.idx

#Run the alignment

varieties='Rosecoco Canadian Pinto'

for variety in $varieties
do
fastqs=`ls ../clean_fastqs/$variety`
for fastq in $fastqs
do
hisat2 -x ../alignment/GCF_000499845.1_PhaVulg1_0_genomic.fna.idx -U ../clean_fastqs/$variety/$fastq -S ../alignment/hisat.sam
done
done
