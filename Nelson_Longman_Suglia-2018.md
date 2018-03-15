# Overview of `Platypus` project
The following is an overview of the analyses we performed for this project.

## Links to Tables and Figures
* [Table 1](https://github.com/hrnelson/ECL243-Winter2018-Platypus/blob/master/Tables/table_1.csv)
* [Table 2](https://github.com/hrnelson/ECL243-Winter2018-Platypus/blob/master/Tables/table_2.csv)
* [PCA Figure](https://github.com/hrnelson/ECL243-Winter2018-Platypus/blob/master/Figures/pca.pdf)
* [Population Structure Figure](https://github.com/hrnelson/ECL243-Winter2018-Platypus/blob/master/Figures/population_structure.pdf)

## Tables
Table 1: Average per-SNP nucleotide diversity, Watterson theta, and heterozygosity across _Suillus brevipes_ populations. The populations included in this table are California coast (CAc), California mountain (CAm), Colorado (CO), and Minnesota (MN). Corresponds to Table 1 in the original paper.

Table 2: Pairwise Fst across _Suillus brevipes_ populations. Corresponds to Table 2 in the original paper.

Scripts necessary to reproduce these tables:
1. **table.sh**: subsets larger VCF file into individual VCF files for each population using VCFtools, and then calculates nucleotide diversity and pairwise Fst using VCFtools, and calculates heterozygosity using PLINK (after converting VCF to PLINK files using VCFTools)
2. **tables.R**: calculates per-SNP nucleotide diversity, Watterson theta, and heterozygosity using files created by above script, creates and exports both tables

## PCA Figure
PCA of sampled _Suillus brevipes populations_. The populations included in this figure are coastal California (red), montaine California (purple), Whitecourt, Canada (yellow), Castle Rock, Canada (orange), Wyoming (blue), Colorado (black), and Minnesota (green). Corresponds to Figure 4 in the original paper.

Scripts necessary to reproduce this figure:
1. **pca.R**: uses the R package flashpcaR to conduct principal components analysis and then plots it in R 

## Population Structure Figure
Estimated _Suillus brevipes_ population structure as inferred by ADMIXTURE. Each individual is represented by a bar partitioned into K colour segments (K = 2 to K = 7). The populations included in this figure are coastal California (CAc), montane California (CAm), Castle Rock, Canada (CANc), Whitecourt, Cananda (CANw), Colorado (CO), Minnesota (MN), and Wyoming (WY). Corresponds to Figure 3 in the original paper.

Scripts necessary to reproduce this figure:
1. **population_structure.sh**: converts file formats using VCFtools and PLINK, and then determines population structure using ADMIXTURE
2. **population_structure.R**: plots results of ADMIXTURE analysis
