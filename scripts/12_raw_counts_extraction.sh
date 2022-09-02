#!/usr/bin/env bash

#less -S ../feature_Counts/Rosecoco/merged_counts_Rosecoco.txt |tail -28135 | awk '{print $1,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26}' > ../feature_Counts/Rosecoco/raw_counts_Rosecoco.txt
less -S ../feature_Counts/Canadian/merged_counts_Canadian.txt |tail -28135 | awk '{print $1,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22}' > ../feature_Counts/Canadian/raw_counts_Canadian.txt
less -S ../feature_Counts/Pinto/merged_counts_Pinto.txt |tail -28135 | awk '{print $1,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22}' > ../feature_Counts/Pinto/raw_counts_Pinto.txt




