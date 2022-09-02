#!/usr/bin/bash

# Creating a list of varieties
varieties='Rosecoco Canadian Pinto'

# Obtaining the accession numbers for each variety
for variety in $varieties
do
grep $variety ../commonbean_degs/accessions/sra_runtable52.txt |cut -d ',' -f1 > ../$variety.txt

# Copying the fastq files for each variety into its own directory
mkdir -p ../clean_fastqs/$variety
accessions=`cat ../accessions/$variety.txt`
for accession in $accessions
do
cp ../clean_fastqs/combined_fastqs/$accession.trimmed.fastq ../clean_fastqs/$variety/
done
done
