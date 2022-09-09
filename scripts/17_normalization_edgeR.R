#This script carries out normalization of counts using trimmed mean of M-values(TMM) method
#Dependencies:limma, edgeR

library(edgeR)

#Normalize the three varieties of the common bean
canadian_d<- calcNormFactors(canadian_d)
canadian_d

rosecoco_d <- calcNormFactors(rosecoco_d)
rosecoco_d

pinto_d <- calcNormFactors(pinto_d)
pinto_d

#sample relation plots
plotMDS(canadian_d, method="bcv", col=as.numeric(canadian_d$samples$group, title(main='Canadian wonder')))
legend("bottomleft", as.character(unique(canadian_d$samples$group)), col=1:4, pch=20)

plotMDS(rosecoco_d, method="bcv", col=as.numeric(rosecoco_d$samples$group, title(main = 'Rosecoco')))
legend("bottomleft", as.character(unique(rosecoco_d$samples$group)), col=1:5, pch=20)

plotMDS(pinto_d, method="bcv", col=as.numeric(pinto_d$samples$group, title(main='Pinto')))
legend("bottomleft", as.character(unique(pinto_d$samples$group)), col=1:3, pch=20)


