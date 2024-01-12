# Companion CSEminer Custom Pipeline for the Analysis in Pediatric Solid Tumors
# Introduction

The use of T cells expressing chimeric antigen receptors (CARs) in immunotherapy offers a potential avenue for enhancing outcomes in pediatric solid tumors, including brain tumors. However, the effectiveness of CAR T cells in combating solid and brain tumors has been limited. The lack of efficacy is likely due to multiple factors, such as suboptimal T-cell fitness, inadequate tumor site homing, the challenging tumor microenvironment, and a limited range of targetable antigens. Current strategies for identifying new targets on the surface of pediatric solid tumors have mainly relied on differential gene expression analysis, typically within a specific subtype of cancer. These approaches may overlook opportunities to discover pan-cancer targets that are effective across various subtypes, as well as cancer-specific exons (CSEs) resulting from alternative splicing. To address this, we conducted an analysis using 1,532 RNA-seq samples from the St. Jude/Washington University Pediatric Cancer Genome Project (PCGP), the National Cancer Institute (NCI) Therapeutically Applicable Research to Generate Effective Treatment (TARGET), and St. Jude Children’s Research Hospital (St. Jude) Cloud real-time clinical genomics data (ClinGen). 

Here we developed a pipeline to identify cancer specific exon.
# Downloading the raw sequencing files:
The raw RNA-seq data for PCGP and St Jude ClinGen samples are available on St Jude Cloud Genomics Platform (https://platform.stjude.cloud/data/cohorts/pediatric-cancer) under the accessions SJC-DS-1001, SJC-DS-1003, SJC-DS-1004 and SJC-DS-1007. NCI TARGET data are available in dbGaP under accession phs000218.

# Configuration Requirements
| Required Packages | Version | Link to package | Notes |
| --- | --- | --- | --- | 
| JAVA | > J2SE-1.5 | https://www.oracle.com/java/technologies/downloads/ | Required to execute the DRPPM jar program |
| STAR | 2.7.1a | https://github.com/alexdobin/STAR | Required for step 1 mapping |
| Python | > 3.5 | https://www.python.org/downloads/ | Required for htseq |
| HTSEQ | 2.0.5 | https://pypi.org/project/HTSeq/ | Required to perform the quantification |

# Process raw sequencing files
  1. RNAseq mapping using STAR
  2. Exon quantification with HTSEQ
  3. Code to normalize exons to FPKM

# 1.1 RNAseq mapping

The following command was used to perform RNAseq mapping. 
| Required programs | Version number |
| --- | --- |
| STAR | 2.7.1a |

The following include required input files
| Inputs | note |
| --- | --- |
| fastq files | place the paired files in ${ALL_READ1} and ${ALL_READ2} |

The following references are necessary for the following parameters
| Parameters | note |
| --- | --- |
| User specified STAR index folder | specify folder path in --genomeDIR |

```


STAR --readFilesIn ${ALL_READ1} ${ALL_READ2} \
     --runThreadN 1 \
     --genomeDir [User specified STAR Index folder] \
     --outFilterType BySJout \
     --outFilterMultimapNmax 20 \
     --alignSJoverhangMin 8 \
     --alignSJstitchMismatchNmax 5 -1 5 5 \
     --alignSJDBoverhangMin 10 \
     --outFilterMismatchNmax 999 \
     --outFilterMismatchNoverReadLmax 0.04 \
     --alignIntronMin 20 \
     --alignIntronMax 100000 \
     --alignMatesGapMax 100000 \
     --genomeLoad NoSharedMemory \
     --outFileNamePrefix ${OUTPUT_PREFIX}. \
     --outSAMmapqUnique 60 \
     --outSAMmultNmax 1 \
     --outSAMstrandField intronMotif \
     --outSAMtype BAM SortedByCoordinate \
     --outReadsUnmapped None \
     --outSAMattrRGline ID:${RG_ID} LB:${RG_LB} PL:${RG_PL} SM:${RG_SM} PU:${RG_PU} \
     --chimSegmentMin 12 \
     --chimJunctionOverhangMin 12 \
     --chimSegmentReadGapMax 3 \
     --chimMultimapNmax 10 \
     --chimMultimapScoreRange 10 \
     --chimNonchimScoreDropMin 10 \
     --chimOutJunctionFormat 1 \
     --quantMode TranscriptomeSAM GeneCounts \
     --twopassMode Basic \
     --peOverlapNbasesMin 12 \
     --peOverlapMMp 0.1 \
     --outWigType wiggle \
     --outWigStrand Stranded \
     --outWigNorm RPM \
     --limitBAMsortRAM 160000000000 \
     --outSAMunmapped Within
```

# 1.2 Exon quantification 

Exon quantification was performed through htseq.
The following input files are necessary.
| Input | Note |
| --- | --- |
| BAM File derived from Step 1.1 | bam index is necessary |


The following reference file is needed.
| References | URL |
| --- | --- |
| gencode.v31.primary_assembly.exon.novelexon.gtf | https://www.dropbox.com/s/visytv8td3ft7hk/gencode.v31.primary_assembly.exon.novelexon.gtf?dl=1 |

The following command was run 
```
htseq-count -f bam -a 0 -r pos -s no -m union -t exon --nonunique all [bam file] [exon gtf file] > [output exon count file]
```

# 1.3 Convert HTSEQ counts to FPKM and TPM files
This steps performs the summary of exon counts to FPKM and TPM tables.
## Installation Notes:
### Shell Command ###

g++ HTSeqcount2fpkmtpm.cpp -O3 -o HTSeqcount2fpkmtpm

| Required Input Files | Example Files | Note |
| --- | --- | --- |
| A list of htseq count files | RHB_countfiles_example.lst | NA |

## Execution Example
### Shell Script ###
```
./HTSeqcount2fpkmtpm RHB_countfiles_example.lst 101 RHB
```
### Other Notes ###
```
# RHB_countfiles_example.lst PCGP_countfile.list is the list of htseqcount output count file location, e.g.
SJRHB003_D_count.txt SJRHB004_D_count.txt SJRHB005_D_count.txt
```
### Example Output ###
```
RHB-summary.txt
RHB_FPKM_final.txt
RHB_TPM_final.txt

```

# Scoring the Exons
1. downloading all the required files
2. calculate a summarized exon abundance
3. calculate an exon enrichment score
4. perform the initial exon filtering
5. summarize result
6. annotate alternative spliced exons

# Annotating the exons (Figure 1)
1. Generating the proteomics data reference
2. Estimating gene-level expression in bone marrow
3. Filtering and prioritizing candidates as Tier 1 and Tier 2

