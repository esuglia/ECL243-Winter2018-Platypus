#required files
	#admixture_pops.fam
	#admixture_pops.2.Q
	#admixture_pops.3.Q
	#admixture_pops.4.Q
	#admixture_pops.5.Q
	#admixture_pops.6.Q
	#admixture_pops.7.Q

#import and combine data 
	data_header <- read.table("admixture_pops.fam")
	data_2 <- cbind(data_header[,1], read.table("admixture_pops.2.Q"))
	data_3 <- cbind(data_header[,1], read.table("admixture_pops.3.Q"))
	data_4 <- cbind(data_header[,1], read.table("admixture_pops.4.Q"))
	data_5 <- cbind(data_header[,1], read.table("admixture_pops.5.Q"))
	data_6 <- cbind(data_header[,1], read.table("admixture_pops.6.Q"))
	data_7 <- cbind(data_header[,1], read.table("admixture_pops.7.Q"))

#rorder data
	data_2 <-data_2[c(1,2,3,4,5,6,7,8,9,10,19,20,21,22,23,24,25,11,12,13,14,15,16,17,18,49,51,50,52,53,54,38,39,49,41,42,26,27,28,29,30,31,32,35,36,37,33,34,43,44,45,46,47,48),]
	data_3 <-data_3[c(1,2,3,4,5,6,7,8,9,10,19,20,21,22,23,24,25,11,12,13,14,15,16,17,18,49,51,50,52,53,54,38,39,49,41,42,26,27,28,29,30,31,32,35,36,37,33,34,43,44,45,46,47,48),]
	data_4 <-data_4[c(1,2,3,4,5,6,7,8,9,10,19,20,21,22,23,24,25,11,12,13,14,15,16,17,18,49,51,50,52,53,54,38,39,49,41,42,26,27,28,29,30,31,32,35,36,37,33,34,43,44,45,46,47,48),]
	data_5 <-data_5[c(1,2,3,4,5,6,7,8,9,10,19,20,21,22,23,24,25,11,12,13,14,15,16,17,18,49,51,50,52,53,54,38,39,49,41,42,26,27,28,29,30,31,32,35,36,37,33,34,43,44,45,46,47,48),]
	data_6 <-data_6[c(1,2,3,4,5,6,7,8,9,10,19,20,21,22,23,24,25,11,12,13,14,15,16,17,18,49,51,50,52,53,54,38,39,49,41,42,26,27,28,29,30,31,32,35,36,37,33,34,43,44,45,46,47,48),]
	data_7 <-data_7[c(1,2,3,4,5,6,7,8,9,10,19,20,21,22,23,24,25,11,12,13,14,15,16,17,18,49,51,50,52,53,54,38,39,49,41,42,26,27,28,29,30,31,32,35,36,37,33,34,43,44,45,46,47,48),]

#plot data (to match figure in paper)
	pdf("population_structure.pdf")
	par(mfrow=c(6,1), mar = c(0,0,0,0))
	barplot(t(as.matrix(subset(data_2, select=c(V2,V1)))), col=c("blue", "red"), border=NA, xaxt = "n", yaxt = "n")
	barplot(t(as.matrix(subset(data_3, select=c(V1,V3,V2)))), col=c("blue", "red", "yellow"), border=NA, xaxt = "n", yaxt = "n")
	barplot(t(as.matrix(subset(data_4, select=c(V1,V2,V3,V4)))), col=c("red", "blue", "yellow", "green"), border=NA, xaxt = "n", yaxt = "n")
	barplot(t(as.matrix(subset(data_5, select=c(V1,V5,V4,V2,V3)))), col=c("blue", "red", "green", "purple", "yellow"), border=NA, xaxt = "n", yaxt = "n")
	barplot(t(as.matrix(subset(data_6, select=c(V3,V6,V5,V1,V4,V2)))), col=c("blue", "red", "green", "purple", "orange", "yellow"), border=NA, xaxt = "n", yaxt = "n")
	barplot(t(as.matrix(subset(data_7, select=c(V2,V6,V1,V5,V4,V3,V7)))), col=c("green", "red", "blue", "yellow", "purple", "orange", "dodgerblue"), border=NA, xaxt = "n", yaxt = "n")
	dev.off()