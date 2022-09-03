#!/usr/bin/env bash

# This script extracts the raw counts from the count matrix
# Dependencies: cat, less, wc, awk

# The first column is the GeneIds, each of the other columns is for the gene count per sample

# Rosecoco species
wc_Rosecoco=$(cat ../feature_Counts/Rosecoco/merged_counts_Rosecoco.txt | wc -l)
less -S ../feature_Counts/Rosecoco/merged_counts_Rosecoco.txt \
 | tail -$wc_Rosecoco \
 | awk '{print $1,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26}' \
 > ../feature_Counts/Rosecoco/raw_counts_Rosecoco.txt

# Canadian species
wc_Canadian=$(cat ../feature_Counts/Rosecoco/merged_counts_Canadian.txt | wc -l)
 less -S ../feature_Counts/Canadian/merged_counts_Canadian.txt \
 | tail -$wc_Canadian \
 | awk '{print $1,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22}' \
 > ../feature_Counts/Canadian/raw_counts_Canadian.txt

# Pinto species
wc_Pinto=$(cat ../feature_Counts/Rosecoco/merged_counts_Pinto.txt | wc -l)
 less -S ../feature_Counts/Pinto/merged_counts_Pinto.txt \
 | tail -$wc_Pinto \
 | awk '{print $1,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22}' \
 > ../feature_Counts/Pinto/raw_counts_Pinto.txt




