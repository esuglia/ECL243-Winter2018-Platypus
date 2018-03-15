#!/bin/bash

#required software
	#VCFtools
	#PLINK

#required files
	#All_Suillus_OUTGROUP.vcf
	#CAc.txt
	#CAm.txt
	#CO.txt
	#MN.txt

#navigate to folder where files and software are stored
cd /Users/hannahnelson/Desktop/2018\ Winter\ Classes/Ecological\ Genomics\ \(ECL\ 243\)/Data\ Project/Data\ \&\ Files

#view VCF file
less -S All_Suillus_OUTGROUP.vcf

#make new VCF files
	
	#California coast (CAc)
	vcftools --vcf All_Suillus_OUTGROUP.vcf --keep CAc.txt --recode --recode-INFO-all --out CAc

	#California mountain (CAm)
	vcftools --vcf All_Suillus_OUTGROUP.vcf --keep CAm.txt --recode --recode-INFO-all --out CAm

	#Colorado (CO)
	vcftools --vcf All_Suillus_OUTGROUP.vcf --keep CO.txt --recode --recode-INFO-all --out CO

	#Minnesota (MN)
	vcftools --vcf All_Suillus_OUTGROUP.vcf --keep MN.txt --recode --recode-INFO-all --out MN

#view new VCF files
	less -S CAc.recode.vcf
	less -S CAm.recode.vcf
	less -S CO.recode.vcf
	less -S MN.recode.vcf

#calculate nucleotide diversity

	#California coast (CAc)
	vcftools --vcf CAc.recode.vcf --site-pi --out nucleotide_diversity_CAc

	#California mountain (CAm)
	vcftools --vcf CAm.recode.vcf --site-pi --out nucleotide_diversity_CAm

	#Colorado (CO)
	vcftools --vcf CO.recode.vcf --site-pi --out nucleotide_diversity_CO

	#Minnesota (MN)
	vcftools --vcf MN.recode.vcf --site-pi --out nucleotide_diversity_MN

#calculate heterozygosity #INCORRECT METHOD

	#California coast (CAc)
	vcftools --vcf CAc.recode.vcf --het --out heterozygosity_CAc

	#California mountain (CAm)
	vcftools --vcf CAm.recode.vcf --het --out heterozygosity_CAm

	#Colorado (CO)
	vcftools --vcf CO.recode.vcf --het --out heterozygosity_CO

	#Minnesota (MN)
	vcftools --vcf MN.recode.vcf --het --out heterozygosity_MN

#calculate heterozygosity #CORRECT METHOD

	#convert vcf files to ped files
	vcftools --vcf CAc.recode.vcf --out CAc --plink
	vcftools --vcf CAm.recode.vcf --out CAm --plink
	vcftools --vcf CO.recode.vcf --out CO --plink
	vcftools --vcf MN.recode.vcf --out MN --plink

	#California coast (CAc)
	./plink --noweb --file CAc --hardy --out CAc
	
	#California mountain (CAm)
	./plink --noweb --file CAm --hardy --out CAm
	
	#Colorado (CO)
	./plink --noweb --file CO --hardy --out CO
	
	#Minnesota (MN)
	./plink --noweb --file MN --hardy --out MN

#calculate pairwise Fst

	#CAc & CAm
	vcftools --vcf All_Suillus_OUTGROUP.vcf --weir-fst-pop CAc.txt --weir-fst-pop CAm.txt --out Fst_CAc_CAm

	#CAc & CO
	vcftools --vcf All_Suillus_OUTGROUP.vcf --weir-fst-pop CAc.txt --weir-fst-pop CO.txt --out Fst_CAc_CO

	#CAc & MN
	vcftools --vcf All_Suillus_OUTGROUP.vcf --weir-fst-pop CAc.txt --weir-fst-pop MN.txt --out Fst_CAc_MN

	#CAm & CO
	vcftools --vcf All_Suillus_OUTGROUP.vcf --weir-fst-pop CAm.txt --weir-fst-pop CO.txt --out Fst_CAm_CO

	#CAm & MN
	vcftools --vcf All_Suillus_OUTGROUP.vcf --weir-fst-pop CAm.txt --weir-fst-pop MN.txt --out Fst_CAm_MN

	#CO & MN
	vcftools --vcf All_Suillus_OUTGROUP.vcf --weir-fst-pop CO.txt --weir-fst-pop MN.txt --out Fst_CO_MN

