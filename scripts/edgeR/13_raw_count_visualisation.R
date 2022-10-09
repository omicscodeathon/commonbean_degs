raw_counts <-read.delim('../feature_Counts/Canadian/raw_counts_Canadian.txt', sep = ' ',header=T)

#Filter out low read counts(<2)
raw_counts_filtered <- subset(raw_counts, rowSums(raw_counts[-1]<=2)!=ncol(raw_counts[-1]))
View(raw)

#Plot the number of genes detected fo each sample
barplot(colSums(raw_counts[,-1]),ylab="Number of detected genes",las=2)#Number of detected genes per sample

#Compare the distribution of counts between the filtered and unfiltered data
boxplot(log2(as.matrix(raw_counts[,-1])+1),ylab=expression('Log'[2]~'Read counts'),las=2,main="Raw data")
boxplot(log2(as.matrix(raw_counts_filtered[-1])+1),ylab=expression('Log'[2]~'Read counts'),las=2,main="filtered data")


