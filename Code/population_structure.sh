#!/bin/bash

#required software
	#VCFtools
	#PLINK
	#ADMIXTURE

#required files
	#All_Suillus_OUTGROUP.vcf

#navigate to folder where files and software are stored
cd /Users/hannahnelson/Desktop/2018\ Winter\ Classes/Ecological\ Genomics\ \(ECL\ 243\)/Data\ Project/Data\ \&\ Files

#make new vcf file with subset of data
vcftools --vcf All_Suillus_OUTGROUP.vcf --keep admixture_pops.txt --recode --recode-INFO-all --out admixture_pops

#convert vcf data to ped file
vcftools --vcf admixture_pops.recode.vcf --out admixture_pops --plink

#convert ped file to bed file
./plink --noweb --file admixture_pops --make-bed --out admixture_pops

#estimate population structure (from k = 2 to k = 7)
./admixture admixture_pops.bed 2
./admixture admixture_pops.bed 3
./admixture admixture_pops.bed 4
./admixture admixture_pops.bed 5
./admixture admixture_pops.bed 6
./admixture admixture_pops.bed 7
