# Companion CSEminer Custom Pipeline for the Analysis of Pediatric Solid Tumors
# Introduction

The use of T cells expressing chimeric antigen receptors (CARs) in immunotherapy offers a potential avenue for enhancing outcomes in pediatric solid tumors, including brain tumors. However, the effectiveness of CAR T cells in combating solid and brain tumors has been limited. The lack of efficacy is likely due to multiple factors, such as suboptimal T-cell fitness, inadequate tumor site homing, the challenging tumor microenvironment, and a limited range of targetable antigens. Current strategies for identifying new targets on the surface of pediatric solid tumors have mainly relied on differential gene expression analysis, typically within a specific subtype of cancer. These approaches may overlook opportunities to discover pan-cancer targets that are effective across various subtypes, as well as cancer-specific exons (CSEs) resulting from alternative splicing. To address this, we conducted an analysis using 1,532 RNA-seq samples from the St. Jude/Washington University Pediatric Cancer Genome Project (PCGP), the National Cancer Institute (NCI) Therapeutically Applicable Research to Generate Effective Treatment (TARGET), and St. Jude Children’s Research Hospital (St. Jude) Cloud real-time clinical genomics data (ClinGen). 

# Contact
Please contact Liqing Tian Liqing.Tian@STJUDE.ORG or Timothy Shaw timothy.shaw@moffitt.org for questions related to running the code.

# Downloading the raw sequencing files:
The raw RNA-seq data for PCGP and St Jude ClinGen samples are available on St Jude Cloud Genomics Platform (https://platform.stjude.cloud/data/cohorts/pediatric-cancer) under the accessions SJC-DS-1001, SJC-DS-1003, SJC-DS-1004 and SJC-DS-1007. NCI TARGET data are available in dbGaP under accession phs000218.

# User Configuration Requirements
| Required Packages | Version | Link to package | Notes |
| --- | --- | --- | --- | 
| JAVA | > J2SE-1.5 | https://www.oracle.com/java/technologies/downloads/ | Required to execute the DRPPM jar program |
| STAR | 2.7.1a | https://github.com/alexdobin/STAR | Required for step 1 mapping |
| Python | 3.7.0 | https://www.python.org/downloads/ | Required for htseq |
| HTSEQ | 0.11.2 | https://pypi.org/project/HTSeq/ | Required to perform the quantification |
| GCC compiler | 9.1.0 | https://gcc.gnu.org/ | Required for step 1.3 to normalize exon counts to FPKM |

# [1. Process raw sequencing files](#1-procedure-for-rnaseq-mapping-and-exon-quantification)
  
  1.1. RNAseq mapping using STAR
  1.2. Exon quantification with HTSEQ
  1.3. Code to normalize exons to FPKM
# 2. Scoring the Exons
  2.1. downloading all the required files
  2.2a. calculate a summarized exon abundance
  2.2b. calculate an exon enrichment score
  2.2c. perform the initial exon filtering
  2.3. summarize result
  2.4. annotate alternative spliced exons

# 3. Annotating the exons (Figure 1) 
  3.1. Generating the proteomics data reference
  3.2. Estimating gene-level expression in bone marrow
  3.3. Filtering and prioritizing candidates as Tier 1 and Tier 2

# 1 Procedure for RNAseq mapping and exon quantification
The procedure provides the process for performing the mapping and quantification of the exons. 1) RNAseq mapping using STAR. 2) Exon quantification with HTSEQ.
3) Normalize exons to FPKM.

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
This step performs the summary of exon counts to FPKM and TPM tables.

## Required Programs 
| Required Packages | Version | 
| --- | --- |
| GCC compiler | 9.1.0 |

## Installation Notes:
### Shell Command for Compilation ###
```
g++ HTSeqcount2fpkmtpm.cpp -O3 -o HTSeqcount2fpkmtpm
```
| Required Input Files | Example Files | Note |
| --- | --- | --- |
| A list of htseq count files | RHB_countfiles_example.lst | NA |

## Execution Example
### Shell Script to generate a FPKM table ###
```
# RHB_countfiles_example.lst contains a list of htseqcount output count file location
# 101 is the read length
# RHB is the prefix for output files
./HTSeqcount2fpkmtpm RHB_countfiles_example.lst 101 RHB
```
### RHB_countfiles_example.lst Example ###
[View the RHB_countfiles_example.lst example](https://raw.githubusercontent.com/shawlab-moffitt/CSEminer-manuscript/main/1_rnaseq_mapping_exonquant/step3_htseq2fpkmtpm/RHB_countfiles_example.lst)
```
'$path to the work directory$'/ExampleFiles/SJRHB003_D_count.txt
'$path to the work directory$'/ExampleFiles/SJRHB004_D_count.txt
'$path to the work directory$'/ExampleFiles/SJRHB005_D_count.txt
```

### Example Output ###
```
RHB-summary.txt # summary table, each row is a sample, columns includes features from htseq-count output, i.e. "Sample","Mapped","no_feature","ambiguous","too_low_aQual","not_aligned","alignment_not_unique"
RHB_FPKM_final.txt # FPKM matrix
RHB_TPM_final.txt # TPM matrix

```

# 2. Custom Procedure to Perform Exon Scoring and Annotation
Procedure 2 contains scripts for 1) Downloading the references and input files. 2) Calculate the Exon Enrichment Scores. 3) Merge Exon Scores from Solid and Brain Tumors. 4) Annotate Putatively Spliced Exons.

# 2.1 Setting up the user environment
Procedure to download the required files.
The user can run step1_setup.sh, which should download all the necessary files for performing exon prioritization.
```
sh step1_setup.sh
```

## The following preprocessed files and programs are available 
| Files | URL | Note | 
| --- | --- | --- |
| DRPPM_20220511A_newmachine.jar | https://github.com/gatechatl/DRPPM/raw/master/export/DRPPM_20220511A_newmachine.jar | jar library containing the processing scripts | 
| GTEx_7526_FPKM_final.txt.tar.gz | https://www.dropbox.com/s/kdl6kbfe2vmpors/GTEx_7526_FPKM_final.txt.tar.gz?dl=1 | GTEX exon quantification file |
| Pediatric_Cancer_FPKM_final.txt.tar.gz | https://www.dropbox.com/s/yx97c913ihw786a/Pediatric_Cancer_FPKM_final.txt.tar.gz?dl=1 | Pediatric Cancer exon quantification file |
| complete_surfaceome_updated_20211114.txt | https://www.dropbox.com/s/26d367pzbkrm8gn/complete_surfaceome_updated_20211114.txt?dl=1 | Surfaceome gene list | 
| Diagnosis_Brain_Clinical_PCGP_TARGET_Sample2DiseaseType_Updated.txt | https://www.dropbox.com/s/ra6sldmhvp2397q/Diagnosis_Brain_Clinical_PCGP_TARGET_Sample2DiseaseType_Updated.txt?dl=1 | Brain cancer sample annotation |
| Diagnosis_Solid_Clinical_PCGP_TARGET_Sample2DiseaseType_Updated.txt | https://www.dropbox.com/s/416si5g3sqa1rva/Diagnosis_Solid_Clinical_PCGP_TARGET_Sample2DiseaseType_Updated.txt?dl=1 | Solid tumor sample annotation |
| GTEx_SampleID2Histology_updated.txt | https://www.dropbox.com/s/q5vk9menww471zz/GTEx_SampleID2Histology_updated.txt?dl=1 | GTEx sample annotation |
| OtherSurfaceomeExonAnnotation.txt | https://www.dropbox.com/s/amf0z6drk8qlqyy/OtherSurfaceomeExonAnnotation.txt?dl=1 | Surfaceome exon annotation |
| GRCh38.primary_assembly.genome.fa.gz | https://www.dropbox.com/s/a6ji1i9k8arevw8/GRCh38.primary_assembly.genome.fa.gz?dl=1 | Assembled human genome | 
| Homo_sapiens_uniprot_sprot_combined.fasta | https://www.dropbox.com/s/311vdzh8o4rw6ml/Homo_sapiens_uniprot_sprot_combined.fasta?dl=1 | Uniprot Protein annotation file |
| Gencode36_Ensembl102_ApprisExonAnnotation.txt | https://www.dropbox.com/s/4ezu3dggqnserq8/Gencode36_Ensembl102_ApprisExonAnnotation.txt?dl=1 | Exon annotation from the APPRIS annotation |
| extra_cellular_matrix.tar.gz | https://www.dropbox.com/s/av9krxya1vtat0t/extra_cellular_matrix.tar.gz?dl=1 | Extra cellular matrix genes |
| therapeutic_targets.tar.gz | https://www.dropbox.com/s/xbycxx36lylocb3/therapeutic_targets.tar.gz?dl=1 | Genes with annotated therapeutic targets |
| surfaceome.tar.gz | https://www.dropbox.com/s/3x4yepb2ickxyzy/surfaceome.tar.gz?dl=1 | surfaceome gene annotation and their databases |

# 2.2 Calculating the cancer enrichment score
## Procedure to download the required files.
The user can run step1_setup.sh to copy over the data downloaded from step 2.1
```
sh step1_copy_parameter_files.sh

```

## Run the following command to generate the scripts
```
sh step2_generate_and_run_script.sh
```

# 2.3. Merge Exon Scores from Solid and Brain Tumors.
The following command will run a custom script to merge all the exon scores together into a single file.
```
sh step1_merge_solid_brain_annotation.sh
# drppm -CSIMinerManuscriptCombineSolidBrainResult [file 1 Solid Tumor Only] [file 2 Brain Tumor Only] [file 3 All] [Output Combined exon score file]
```
# 2.4. Annotate putatively spliced exons
The custom Java program checks whether the exon marked as differentially expressed and enriched in the tumor is an exon that is part of an alternative transcript.

| Required Files | URL | Note |
| --- | --- | --- |
| gencode.v35.primary_assembly.annotation.gtf | https://www.dropbox.com/s/bc0fii0jsccwpie/gencode.v35.primary_assembly.annotation.gtf?dl=1 | GTF file containing the exon-transcripts |

```
sh step2_exon_prioritization_example.sh

# the shell script performs the following command
drppm -CSEminerPrioritizationScript Comprehensive_Exon_Annotations_20220217.txt gencode.v35.primary_assembly.annotation.gtf Output_Exon_AS_Annotations.txt Output_Exon_Annotations.txt
```

Finally, the exons are then manually reviewed to identify alternatively spliced exons. 

# 3. Procedure for summarizing the data used in Figure 1, Supplementary Tables, and data highlighted in cseminer.stjude.org
  1. Download the pipeline data.
  2. Download the DRPPM jar package
  3. Execute the summarization script that is available [here](https://github.com/gatechatl/DRPPM/blob/master/src/rnaseq/splicing/cseminer/prioritization/CSEminerFigure1ExonClassificationFullPipelineExecMode.java)

# User Configuration Requirements
| Required Packages | Version | Link to package | Notes |
| --- | --- | --- | --- | 
| JAVA | > J2SE-1.5 | https://www.oracle.com/java/technologies/downloads/ | Required to execute the DRPPM jar program |
| DRPPM Package | 20240112 | https://github.com/gatechatl/DRPPM/raw/master/export/DRPPM_20240112A_newmachine.jar | The library wraps the code for execution |

# Shell Script
```
# download the files from dropbox 
curl --output pipeline_input_files.zip -kL https://www.dropbox.com/scl/fi/cem2argxukr5fqlb49m0k/pipeline_input_files.zip?rlkey=3wzegacn26m0sphz0bnsccu9b&dl=0
# download the DRPPM library package 
curl --output DRPPM_20240112A_newmachine.jar -kL https://github.com/gatechatl/DRPPM/raw/master/export/DRPPM_20240112A_newmachine.jar
# Unpack the zip files
mkdir CompleteAnnotationPipeline

unzip pipeline_input_files.zip

mv pipeline_input_files CompleteAnnotationPipeline/pipeline_input_files

mkdir OutputFolder

# Execute the code
./drppm -CSEminerFigure1ExonClassificationFullPipelineExecMode CompleteAnnotationPipeline/ OutputFolder
```
The program performs the final summarization, generating the counts and supplementary data tables used in the manuscript.






