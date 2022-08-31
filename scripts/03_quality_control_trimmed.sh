#!/usr/bin/env bash

#Quality check after trimming
mkdir -p fastqc_reports/trimmed_fastqs
fastqc -t 8 fastp_results/*.fastq -o fastqc_reports/trimmed_fastqs
