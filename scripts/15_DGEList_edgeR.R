#This script creates a DGElist and filters the data
#Dependencies: limma,edgeR

library(limma)
library(edgeR)

#Create the DGEList for all varieties
canadian_raw_counts <-read.delim('../feature_Counts/Canadian/raw_counts_Canadian.txt', sep = ' ',header=T)
canadian_d <- DGEList(counts=canadian_raw_counts[-1] , group=canadian_metadata$dev_stage)
canadian_d

rosecoco_raw_counts <-read.delim('../feature_Counts/Rosecoco/raw_counts_Rosecoco.txt', sep = ' ',header=T)
rosecoco_d <- DGEList(counts=rosecoco_raw_counts[-1] , group=rosecoco_metadata$dev_stage)
rosecoco_d

pinto_raw_counts <-read.delim('../feature_Counts/Pinto/raw_counts_Pinto.txt', sep = ' ',header=T)
pinto_d <-DGEList(counts = pinto_raw_counts[-1], group =pinto_metadata$dev_stage)
pinto_d

