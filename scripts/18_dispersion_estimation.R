#This script carries out estiamtion of dispersion parameters

library(limma)
library(edgeR)

#Dispersion estiamtion for the three common bean varieties
canadian_d <-estimateDisp(canadian_d)
rosecoco_d <-estimateDisp(rosecoco_d)
pinto_d <-estimateDisp(pinto_d)

#Plot tagwise biological coefficient of variation (square root of dispersions) against log2-CPM
plotBCV(canadian_d)
plotBCV(rosecoco_d)
plotBCV(pinto_d)
