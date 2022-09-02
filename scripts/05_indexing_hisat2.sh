#!/usr/bin/env bash

# Download the reference genome

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/499/845/GCF_000499845.1_PhaVulg1_0/GCF_000499845.1_PhaVulg1_0_genomic.fna.gz
gunzip GCF_000499845.1_PhaVulg1_0_genomic.fna.gz

#Build the index file

mv GCF_000499845.1_PhaVulg1_0_genomic.fna ../alignment/
hisat2-build -f ../alignment/GCF_000499845.1_PhaVulg1_0_genomic.fna ../alignment/GCF_000499845.1_PhaVulg1_0_genomic.fna.idx
