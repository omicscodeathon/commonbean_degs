#This script obtains the most differentially expressed genes for each variety conditions

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

