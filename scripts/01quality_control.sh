#!/usr/bin/bash

#Quality control assessment

fastqc -t 8 fastqs/*.fastq -o fastqc_reports

#Trimming and filtering of sequences

sample_id=`ls fastqs/*.fastq`
for id in $sample_id
do
name=`basename -s '.fastq' $id`
mkdir -p fastp_results
./fastp -i $id -o fastp_results/$name.trimmed.fastq -e 20 --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA
done

#Quality check after trimming
mkdir -p fastqc_reports/trimmed_fastqs
fastqc -t 8 fastp_results/*.fastq -o fastqc_reports/trimmed_fastqs
