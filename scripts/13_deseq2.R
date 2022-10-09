library(DESeq2)
#Read the meatadata
metadata <- read.csv('../commonbean_degs/accessions/sra_runtable52.txt')

#Obtain the sample names and development stages 
run_name<- metadata$Run
str(run_name)
sample_name <- metadata$sample_name
dev_stage <- gsub('days after flowering', '', metadata$plant_developmental_stage)

#Create a dataframe 
metadatadf <- data.frame(sample_name,dev_stage)
rownames(metadatadf) <- run_name
View(metadatadf)

#Sorting metadata for the 3 common bean varieties
#canadian
canadian_metadata2 <- canadian_metadata[order(row.names(canadian_metadata)), ]

#rosecoco
rosecoco_metadata2 <- rosecoco_metadata[order(row.names(rosecoco_metadata)), ]

#pinto
pinto_metadata2 <- pinto_metadata[ order(row.names(pinto_metadata)), ]


#Create a dds object for each of the common bean varieties
#canadian
canadian_dds <- DESeqDataSetFromMatrix(countData=canadian_raw_counts, 
                                    colData=canadian_metadata2, 
                                    design=~dev_stage, tidy = TRUE)

#rosecoco
rosecoco_dds <- DESeqDataSetFromMatrix(countData=rosecoco_raw_counts, 
                                       colData=rosecoco_metadata2, 
                                       design=~dev_stage, tidy = TRUE)
#pinto
pinto_dds <- DESeqDataSetFromMatrix(countData=pinto_raw_counts, 
                              colData=pinto_metadata2, 
                              design=~dev_stage, tidy = TRUE)
canadian_dds
rosecoco_dds
pinto_dds

#Filter out low counts
#canadian
keep <- rowSums(counts(canadian_dds)) >=10
canadian_dds <- canadian_dds[keep, ]

#rosecoco
keep <- rowSums(counts(rosecoco_dds)) >=10
rosecoco_dds <- rosecoco_dds[keep, ]

#pinto
keep <- rowSums(counts(pinto_dds)) >=10
pinto_dds <- pinto_dds[keep, ]

canadian_dds
rosecoco_dds
pinto_dds


#Select reference level
canadian_dds$dev_stage <- relevel(canadian_dds$dev_stage, ref='30')
rosecoco_dds$dev_stage <- relevel(rosecoco_dds$dev_stage, ref='30')
pinto_dds$dev_stage <- relevel(pinto_dds$dev_stage, ref='30')

#Run DESeq analysis
canadian_dds<- DESeq(canadian_dds)
rosecoco_dds<- DESeq(rosecoco_dds)
pinto_dds<- DESeq(pinto_dds)

#Extract results of DE analysis 30 vs 15 days
canadian_res15_30 <- results(canadian_dds, alpha = 0.01, contrast=c('dev_stage', '15','30'))
rosecoco_res15_30 <- results(rosecoco_dds, alpha = 0.01, contrast=c('dev_stage', '15','30'))
pinto_res15_30 <- results(pinto_dds, alpha = 0.01, contrast=c('dev_stage', '15','30'))

#Extract results of DE analysis 30 vs 20 days
canadian_res20_30 <- results(canadian_dds, alpha = 0.01, contrast=c('dev_stage', '20','30'))
rosecoco_res20_30 <- results(rosecoco_dds, alpha = 0.01, contrast=c('dev_stage', '20','30'))
pinto_res20_30 <- results(pinto_dds, alpha = 0.01, contrast=c('dev_stage', '20','30'))

#Extract results of DE analysis 30 vs 35 days
canadian_res35_30 <- results(canadian_dds, alpha = 0.01, contrast=c('dev_stage', '35','30'))
rosecoco_res35_30 <- results(rosecoco_dds, alpha = 0.01, contrast=c('dev_stage', '35','30'))
pinto_res35_30 <- results(pinto_dds, alpha = 0.01, contrast=c('dev_stage', '35','30'))


summary(canadian_res15_30) 
summary(rosecoco_res15_30) 
summary(pinto_res15_30) 

summary(canadian_res20_30) 
summary(rosecoco_res20_30) 
summary(pinto_res20_30) 

summary(canadian_res35_30) 
summary(rosecoco_res35_30) 
summary(pinto_res35_30) 



#Order by Pvalues
canadian_res15_30<- canadian_res15_30[order(canadian_res15_30$padj),]
rosecoco_res15_30 <- rosecoco_res15_30[order(rosecoco_res15_30$padj),]
pinto_res15_30 <- pinto_res15_30[order(pinto_res15_30$padj),]

canadian_res20_30<- canadian_res20_30[order(canadian_res20_30$padj),]
rosecoco_res20_30 <- rosecoco_res20_30[order(rosecoco_res20_30$padj),]
pinto_res20_30 <- pinto_res20_30[order(pinto_res20_30$padj),]

canadian_res35_30<- canadian_res35_30[order(canadian_res35_30$padj),]
rosecoco_res35_30 <- rosecoco_res35_30[order(rosecoco_res35_30$padj),]
pinto_res35_30 <- pinto_res35_30[order(pinto_res35_30$padj),]

canadian_res15_30
rosecoco_res15_30 
pinto_res15_30

canadian_res20_30
rosecoco_res20_30 
pinto_res20_30

canadian_res35_30
rosecoco_res35_30 
pinto_res35_30


#Plot counts of the top gene in the different groups 
par(mfrow=c(2,2))
plotCounts(canadian_dds, gene='PHAVU_005G071300g', intgroup="dev_stage", main= 'Canadian  for gene PHAVU_005G071300g')
plotCounts(rosecoco_dds, gene='PHAVU_004G162100g', intgroup="dev_stage", main= 'Rosecoco for gene PHAVU_004G162100g')
plotCounts(pinto_dds, gene='PHAVU_005G071400g', intgroup="dev_stage", main= 'Pinto for gene PHAVU_005G071400g')



# Make a basic volcano plot for the three varieties 15 vs 30 days
par(mfrow=c(2,2))
#Canadian
with(canadian_res15_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Canadian 15 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(canadian_res15_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(canadian_res15_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

#Rosecoco
with(rosecoco_res15_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Rosecoco 15 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(rosecoco_res15_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(rosecoco_res15_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

#Pinto
with(pinto_res15_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Pinto 15 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(pinto_res15_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(pinto_res15_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

# Make a basic volcano plot for the three varieties 20 vs 30 days
par(mfrow=c(2,2))
#Canadian
with(canadian_res20_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Canadian 20 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(canadian_res20_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(canadian_res20_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

#Rosecoco
with(rosecoco_res20_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Rosecoco 20 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(rosecoco_res20_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(rosecoco_res20_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

#Pinto
with(pinto_res20_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Pinto 20 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(pinto_res20_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(pinto_res20_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

# Make a basic volcano plot for the three varieties 35 vs 30 days
par(mfrow=c(2,2))
#Canadian
with(canadian_res35_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Canadian 35 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(canadian_res35_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(canadian_res35_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

#Rosecoco
with(rosecoco_res35_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Rosecoco 35 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(rosecoco_res35_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(rosecoco_res35_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

#Pinto
with(pinto_res35_30, plot(log2FoldChange, -log10(pvalue), pch=20, main="Pinto 35 vs 30 days", xlim=c(-20,20),ylim=c(0,50)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(pinto_res35_30, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col='blue'))
with(subset(pinto_res35_30, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))


#Plot PCA plots
par(mfrow=c(2,2))
#canadian
vsdata <- vst(canadian_dds, blind=FALSE)
plotPCA(vsdata, intgroup="dev_stage", title(main='Canadian'))

#Rosecoco
vsdata <- vst(rosecoco_dds, blind=FALSE)
plotPCA(vsdata, intgroup="dev_stage", title(main='Rosecoco'))

#Pinto
vsdata <- vst(pinto_dds, blind=FALSE)
plotPCA(vsdata, intgroup="dev_stage", title(main='Pinto'))

?plotPCA

#Plot MA plot
par(mfrow=c(2,2))
#Canadian
plotMA(canadian_dds,main = "Canadian")
abline(h=c(-1,1), col="dodgerblue", lwd=2)

#Rosecoco
plotMA(rosecoco_dds,main = "Rosecoco")
abline(h=c(-1,1), col="dodgerblue", lwd=2)

#Pinto
plotMA(pinto_dds,main = "Pinto")
abline(h=c(-1,1), col="dodgerblue", lwd=2)

#PLot dispersion plot
par(mfrow=c(2,2))
plotDispEsts(canadian_dds, main = "Canadian")
plotDispEsts(rosecoco_dds, main = "Rosecoco")
plotDispEsts(pinto_dds, main = "Pinto")


#GO annotation
library(clusterProfiler)
BiocManager::install('AnnotationHub')
library(AnnotationHub)
hub <- AnnotationHub()
yes
query(hub, "Phasoelus")

?AnnotationDb
