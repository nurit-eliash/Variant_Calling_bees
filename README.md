# Variant_Call_bees
check the snakemake workflow of varroa, is the heterozygotic sites are bioinformatic artifact?

## Aim:
Check the level of heterozygosity in males of other haplo-diplo species.
for that, we checked the varroa - snakemake workflow on Apis mellifera genomes, males and females

### Workflow:
(1) pick male and female whole genome sequencing:  
Workflow for search:  
* In ncbi, SRA, search for Apis mellifera
* Filter for ‘DNA’, Illumina, genome, paired, 
  press on the ‘Send results to Run selector’ option, at the top of the page
* A ‘Run Selector :: NCBI’ page will open with all SRR data applicable under the filters
* Download the metadata file, and search for a BioProject that contain both males, and females (under the ‘sex’ column) 
import SRR fastq files, using the ‘SRA_import.slurm’ (fasterq-dump commnad)

(2) adjust the Snakemake pipeline with the new ref genome  

(3) run it – 14968153 (72 fastq files)  

(4) run the ‘VCF_filter_stats.slurm’  

(5) Rmd for heterozygosity proportion (script avaiable in 'male bees.Rmd')  

I chose (Wragg et al. 2016), BioProject PRJNA311274 which contain 872 SRAs of WGS of A. mellifera.

"A resequencing project to characterize the genetic diversity of honeybees throughout France".

Of the 872 SRAs, only samples collected in Reunion (France) have both males and females:   
* All pupa/larva
* All thorax tissues
* All Apis mellifera
* total of 36 samples: haploid males (6 SRRs), diploid females (30 SRRs).
