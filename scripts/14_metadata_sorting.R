#This script sorts metadata of each variety and retains only the development stage and sample names

#Read the meatadata
metadata <- read.csv('../commonbean_degs/accessions/sra_runtable52.txt')

#Obtain the sample names and development stages 
run_name<- metadata$Run
sample_name <- metadata$sample_name
dev_stage <- gsub('days after flowering', '', metadata$plant_developmental_stage)

#Create a dataframe 
metadatadf <- data.frame(sample_name,dev_stage)
rownames(metadatadf) <- run_name
head(metadatadf)

#Extracting metadata for Canadian variety
canadian_metadata <- metadatadf[rownames(metadatadf) %in% c('ERR6004302', 'ERR6004304','ERR6004309','ERR6004323','ERR6004330',' ERR6004349','ERR6004303','ERR6004306','ERR6004308','ERR6004310','ERR6004312','ERR6004319',' ERR6004321','ERR6004324','ERR6004337','ERR600434'), ]
canadian_metadata

#Extracting metadata for Rosecoco variety
rosecoco_metadata <- metadatadf[rownames(metadatadf) %in% c('ERR6004311', 'ERR6004322', 'ERR6004325' , 'ERR6004332' , 'ERR6004336', 'ERR6004339', 'ERR6004351', 'ERR6004353', 'ERR6004315', 'ERR6004317','ERR6004318','ERR6004326','ERR6004329','ERR6004334','ERR6004335','ERR6004338','ERR6004340','ERR6004348','ERR6004350','ERR6004352'), ]                  
rosecoco_metadata

#Extracting metadata for Pinto variety
pinto_metadata <- metadatadf[rownames(metadatadf) %in% c('ERR6004305','ERR6004307','ERR6004313',' ERR6004314','ERR6004316',' ERR6004320','ERR6004327',' ERR6004328',' ERR6004341','ERR6004343','ERR6004344','ERR6004346','ERR6004331',' ERR6004333','ERR6004345','ERR6004347'), ]
pinto_metadata                                                         
                             
                             
