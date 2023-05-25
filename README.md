# CSEminer-pipeline

# Introduction

The use of T cells expressing chimeric antigen receptors (CARs) in immunotherapy offers a potential avenue for enhancing outcomes in pediatric solid tumors, including brain tumors. However, the effectiveness of CAR T cells in combating solid and brain tumors has been limited. The lack of efficacy is likely due to multiple factors, such as suboptimal T-cell fitness, inadequate tumor site homing, the challenging tumor microenvironment, and a limited range of targetable antigens. Current strategies for identifying new targets on the surface of pediatric solid tumors have mainly relied on differential gene expression analysis, typically within a specific subtype of cancer. These approaches may overlook opportunities to discover pan-cancer targets that are effective across various subtypes, as well as cancer-specific exons (CSEs) resulting from alternative splicing. To address this, we conducted an analysis using 1,532 RNA-seq samples from the St. Jude/Washington University Pediatric Cancer Genome Project (PCGP), the National Cancer Institute (NCI) Therapeutically Applicable Research to Generate Effective Treatment (TARGET), and St. Jude Children’s Research Hospital (St. Jude) Cloud real-time clinical genomics data (ClinGen). 

Here we developed a pipeline to identify cancer specific exon.
# Process raw sequencing files:
1. mapping,
2. exon-quantification
3. exon-normalization
4. generation of exon summary. 

# Scoring the Exons
1. downloading all the required files
2. calculate a summarized exon abundance
3. calculate a exon enrichment score
4. perform the initial exon filtering
5. summarize result
6. annotate alternative spliced exons

# Prioritizing exons
1. generating the proteomics data reference
2. generating an IHC staining reference
3. bone marrow filtering
4. filter then prioritize candidates as Tier 1 and Tier 2
