#This script conducts the exactTest for for determining differential expression
#Dependencies: edgeR

library(edgeR)

#Pairwise exactTests of the commonbean varieties
canadian_et30_15 <- exactTest(canadian_d, pair = c('30','15'))
canadian_et30_20 <- exactTest(canadian_d, pair = c('30','20'))
canadian_et30_35 <- exactTest(canadian_d, pair = c('30','35'))

rosecoco_et30_15 <- exactTest(rosecoco_d, pair = c('30','15'))
rosecoco_et30_20 <- exactTest(rosecoco_d, pair = c('30','20'))
rosecoco_et30_35 <- exactTest(rosecoco_d, pair = c('30','35'))
rosecoco_et30_30df <- exactTest(rosecoco_d, pair = c('30','30 different kit'))

pinto_et30_15 <- exactTest(pinto_d, pair = c('30','15'))
pinto_et30_20<- exactTest(pinto_d, pair = c('30','20'))
pinto_et30_35 <- exactTest(pinto_d, pair = c('30','35'))


#Extract the most differentially expressed genes for each variety conditions
canadian_topTags30_15 <- topTags(canadian_et30_15)
canadian_topTags30_20 <- topTags(canadian_et30_20)
canadian_topTags30_35 <- topTags(canadian_et30_35)

rosecoco_topTags30_15 <- topTags(rosecoco_et30_15)
rosecoco_topTags30_20 <- topTags(rosecoco_et30_20)
rosecoco_topTags30_35 <- topTags(rosecoco_et30_35)
rosecoco_topTags30_30df <- topTags(rosecoco_et30_30df)

pinto_topTags30_15 <- topTags(pinto_et30_15)
pinto_topTags30_20 <- topTags(pinto_et30_20)
pinto_topTags30_35 <- topTags(pinto_et30_35)

canadian_topTags30_15
pinto_topTags30_20
rosecoco_topTags30_20
