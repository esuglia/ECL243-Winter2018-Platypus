#required files
	#nucleotide_diversity_CAc.sites.pi
	#nucleotide_diversity_CAm.sites.pi
	#nucleotide_diversity_CO.sites.pi
	#nucleotide_diversity_MN.sites.pi
	#CAc.hwe
	#CAm.hwe
	#CO.hwe
	#MN.hwe
	#CAc.txt
	#CAm.txt
	#CO.txt
	#MN.txt
	#Fst_CAc_CAm.weir.fst
	#Fst_CAc_CO.weir.fst
	#Fst_CAc_MN.weir.fst
	#Fst_CAm_CO.weir.fst
	#Fst_CAm_MN.weir.fst
	#Fst_CO_MN.weir.fst

#calculate nucleotide diversity

	#initialize vector
	nucleotide_diversity <- c(rep(NA,4))

	#California coast (CAc)
	data <- read.table("nucleotide_diversity_CAc.sites.pi", header = TRUE)
	nucleotide_diversity[1] <- round(mean(data$PI), digits = 3)

	#California mountain (CAm)
	data <- read.table("nucleotide_diversity_CAm.sites.pi", header = TRUE)
	nucleotide_diversity[2] <- round(mean(data$PI), digits = 3)

	#Colorado (CO)
	data <- read.table("nucleotide_diversity_CO.sites.pi", header = TRUE)
	nucleotide_diversity[3] <-round(mean(data$PI), digits = 3)

	#Minnesota (MN)
	data <- read.table("nucleotide_diversity_MN.sites.pi", header = TRUE)
	nucleotide_diversity[4] <-round(mean(data$PI), digits = 3)

#calculate heterozygosity 

	#initialize vector
	heterozygosity <- c(rep(NA,4))

	#California coast (CAc)
	data <- read.table("CAc.hwe", header = T, stringsAsFactors = F, fill = TRUE, na.strings = "nan")
	heterozygosity[1] <- round(mean(data[,7], na.rm = TRUE), 3)

	#California mountain (CAm)
	data <- read.table("CAm.hwe", header = T, stringsAsFactors = F, fill = TRUE, na.strings = "nan")
	heterozygosity[2] <- round(mean(data[,7], na.rm = TRUE), 3)

	#Colorado (CO)
	data <- read.table("CO.hwe", header = T, stringsAsFactors = F, fill = TRUE, na.strings = "nan")
	heterozygosity[3] <- round(mean(data[,7], na.rm = TRUE), 3)

	#Minnesota (MN)
	data <- read.table("MN.hwe", header = T, stringsAsFactors = F, fill = TRUE, na.strings = "nan")
	heterozygosity[4] <- round(mean(data[,7], na.rm = TRUE), 3)

#calculate Watterson's theta
#https://en.wikipedia.org/wiki/Watterson_estimator

	#initialize vector
	watterson_theta <- c(rep(NA,4))

	#California coast (CAc)
	data <- read.table("nucleotide_diversity_CAc.sites.pi", header = TRUE)
	K <- length(which(data$PI != 0))/length(data$PI)	#number of segregating sites (SNPs) per site
	n <- nrow(read.table("CAc.txt")) #number of individuals
	a <- 0 
	for (i in 1: (n-1)) { #calculate harmonic number
		a = a + 1/i
	}
	watterson_theta[1] <- round(K/a,3) #Watterson's theta

	#California mountain (CAm)
	data <- read.table("nucleotide_diversity_CAm.sites.pi", header = TRUE)
	K <- length(which(data$PI != 0))/length(data$PI)	#number of segregating sites (SNPs) per site
	n <- nrow(read.table("CAm.txt")) #number of individuals
	a <- 0 
	for (i in 1: (n-1)) { #calculate harmonic number
		a = a + 1/i
	}
	watterson_theta[2] <- round(K/a,3) #Watterson's theta

	#Colorado (CO)
	data <- read.table("nucleotide_diversity_CO.sites.pi", header = TRUE)
	K <- length(which(data$PI != 0))/length(data$PI)	#number of segregating sites (SNPs) per site
	n <- nrow(read.table("CO.txt")) #number of individuals
	a <- 0 
	for (i in 1: (n-1)) { #calculate harmonic number
		a = a + 1/i
	}
	watterson_theta[3] <- round(K/a,3) #Watterson's theta

	#Minnesota (MN)
	data <- read.table("nucleotide_diversity_MN.sites.pi", header = TRUE)
	K <- length(which(data$PI != 0))/length(data$PI)	#number of segregating sites (SNPs) per site
	n <- nrow(read.table("MN.txt")) #number of individuals
	a <- 0 
	for (i in 1: (n-1)) { #calculate harmonic number
		a = a + 1/i
	}
	watterson_theta[4] <- round(K/a,3) #Watterson's theta

#calculate pairwise Fst

	#initialize matrix
	pairwise_Fst <- matrix(0, nrow = 4, ncol = 4)

	#CAc & CAm
	data <- read.table("Fst_CAc_CAm.weir.fst", header = TRUE)
	pairwise_Fst[2,1] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)
	pairwise_Fst[1,2] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)

	#CAc & CO
	data <- read.table("Fst_CAc_CO.weir.fst", header = TRUE)
	pairwise_Fst[3,1] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)
	pairwise_Fst[1,3] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)

	#CAc & MN
	data <- read.table("Fst_CAc_MN.weir.fst", header = TRUE)
	pairwise_Fst[4,1] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)
	pairwise_Fst[1,4] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)

	#CAm & CO
	data <- read.table("Fst_CAm_CO.weir.fst", header = TRUE)
	pairwise_Fst[3,2] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)
	pairwise_Fst[2,3] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)

	#CAm & MN
	data <- read.table("Fst_CAm_MN.weir.fst", header = TRUE)
	pairwise_Fst[4,2] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)
	pairwise_Fst[2,4] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)

	#CO & MN
	data <- read.table("Fst_CO_MN.weir.fst", header = TRUE)
	pairwise_Fst[4,3] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)
	pairwise_Fst[3,4] <- round(mean(na.omit(data$WEIR_AND_COCKERHAM_FST)), digits = 2)

#export tables
	#Table 1
	table_1 <- data.frame(nucleotide_diversity, watterson_theta, heterozygosity)
	row.names(table_1) <- c("CAc", "CAm", "CO", "MN")
	write.csv(table_1,"table_1.csv")
	
	#Table 2
	table_2 <- data.frame(pairwise_Fst)
	table_2[1,1] <- NA
	table_2[2,2] <- NA
	table_2[3,3] <- NA
	table_2[4,4] <- NA
	rownames(table_2) <- c("CAc", "CAm", "CO", "MN")
	colnames(table_2) <- c("CAc", "CAm", "CO", "MN")
	write.csv(table_2,"table_2.csv")
	
	