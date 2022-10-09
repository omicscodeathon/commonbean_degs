#This script is for visualizations of DESEQ2.

#PCA plot
vsdata <- vst(days(15, 20, 30,35)_dds, blind=FALSE)
plotPCA(vsdata, intgroup="subspecific_genetic_lineage_rank")

#Plot MA plot
par(mfrow=c(2,2))
plotMA(days15_dds,main = "15 days")#plot for all development stages
abline(h=c(-1,1), col="dodgerblue", lwd=2)

#PLot dispersion plot
par(mfrow=c(1,1))
plotDispEsts(canadian_dds, main = "Canadian wonder")
plotDispEsts(rosecoco_dds, main = "Rosecoco")
plotDispEsts(pinto_dds, main = "Pinto")

#Volcano plots 
library(ggplot2)
library(gridExtra)

df <- as.data.frame(days20_res_pr)
df$diffexpressed <- "NO"
df$diffexpressed[df$log2FoldChange > 2 & df$padj<0.05] <- "UP"
df$diffexpressed[df$log2FoldChange < -2 & df$padj < 0.05] <- "DOWN"
mycolors <- c("cyan3", "brown1", "darkgray")
names(mycolors) <- c("DOWN", "UP", "NO")

p <- ggplot(data=df, aes(x=log2FoldChange, y=-log10(pvalue), col=diffexpressed)) + geom_point() + theme_minimal() + ggtitle('20 DAF')
p2 <- p + geom_vline(xintercept=c(-2, 2), col="red") +
  geom_hline(yintercept=-log10(0.05), col="red")
p20 <-p2 + scale_colour_manual(values = mycolors)
get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}
legend <- get_legend(p20)
p20 <- p20 + theme(legend.position="none")
grid.arrange(p15, p20, p30, p35, nrow=2, ncol=2)

#venn gplots
library(gplots)

# Create a Venn-diagram given just the list of gene-names for both sets
require(VennDiagram)
vp <- venn.diagram(list('15DAF' = up15cr,
                        "20DAF" = up20cr,
                        '30DAF' = up30cr,
                        '35DAF' = up35cr), 
                   fill = 2:5, alpha = 0.3, filename = NULL);
grid.draw(vp)

#Dotplots for functional enrichment analysis
dotplot(ego, showCategory=10)


















