
**CSE-miner 
Provides a repository of highly expressed protein-coding exons as targets for antibody/CAR-based therapy.**

| Pages | Features |
| --- | --- |
| 1A Table View | Visualization of exon targets and their expression |
| 1B Normalized Expression Heatmap of Candidates | Heatmap visualization of Tier1 targets in percentile |
| 1C Prevalence of Candidate | Fraction of samples with high expression |
| 2 Scatterplot View | Pan-tumor-vs-normal expression |
| 3 Gene View | Genome-level visualization of prioritized exon targets |
| 4 Heatmap View | Heatmap visualization of exon expression |


**Table View**
On the table view, the distribution of exon expression in normal tissues and tumor types can be examined in percentile (middle panel) and quartiles (bottom panel). 

ExonID: Exon coordinates on the hg38 genome

GeneName: Gene Symbol

CandidateCategory: 
   * Tier1 candidates: high-priority candidates with limited expression in normal samples.
   * Tier2 candidates: candidates with expression in key normal tissues.
      
Class: 
   1. Gene target: gene-level candidates
   2. AS target: alternatively spliced exon target
      
GTEx_Normal:
   * List of normal tissue with high expression of the exon target.

TargetDisease:
   * List of diseases that the exon can be used to target.
   
ProteinType
   * Annotation of the protein category. ECM - extracellular matrix. 
   
Location
   * Major protein localization categories. Matrisome, Surfaceome, and Surfaceome+Matrisome.
   
Oncofetal
   * Confetal gene annotation that is associated with 
   
PanCancerExprScore
   * Pan-Cancer Expression calculated based on a binned score (see figure below). 
<img width="761" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/28517151-4e2f-4ca1-88ef-769c21655fe4">

PanNormalExprScore
   * Pan-normal Expression.

WeightedDEScore
   * Weighted score of the differential expression between tumor and normal samples.
