#required files
	#admixture_pops.bed
	#admixture_pops.bim
	#admixture_pops.fam

#load relevant library
library(flashpcaR)

#import data and run analysis
f <- flashpca("admixture_pops", ndim = 2)
str(f) #check attributes of output

#plot results
#colors determined by looking at order of samples in admixture_pops.fam
pdf("pca.pdf")
plot(f$vectors[,1:2], xlab = "PC1", ylab = "PC2", pch = 16, col = c(
	rep("red",9), 	# California (coast)
	rep("purple",16), # California (mountain)
	rep("orange",7), 	# Alberta (Castle Rock)
	rep("yellow",5), 	# Alberta (Whitecourt)
	rep("black",5), 	# Colorado
	rep("green",6),	# Minnesota
	rep("blue",6) 	# Wyoming
	))
dev.off()
