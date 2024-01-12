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

# Process raw sequencing files:
1. mapping,
2. exon-quantification to counts
3. exon-normalization and summary. 

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
