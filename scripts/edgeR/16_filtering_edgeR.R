#This script filters out low count genes using counts per million

#Create a copy of the original counts
canadian_d2 <- canadian_d
rosecoco_d2 <- rosecoco_d
pinto_d2 <- pinto_d

#Check the dimensions of unfiltered counts
dim(canadian_d)
dim(rosecoco_d)
dim(pinto_d)

#Filter genes with cpm less than 100 in at least 2 samples
keep <- rowSums(cpm(canadian_d)>100) >= 2
canadian_d<- canadian_d[keep,]
dim(canadian_d)

keep <- rowSums(cpm(rosecoco_d)>100) >= 2
rosecoco_d<- rosecoco_d[keep,]
dim(rosecoco_d)

keep <- rowSums(cpm(pinto_d)>100) >= 2
pinto_d<- pinto_d[keep,]
dim(pinto_d)

#Reset the library sizes
canadian_d$samples$lib.size <- colSums(canadian_d$counts)
canadian_d$samples

rosecoco_d$samples$lib.size <- colSums(rosecoco_d$counts)
rosecoco_d$samples

pinto_d$samples$lib.size <- colSums(pinto_d$counts)
pinto_d$samples
