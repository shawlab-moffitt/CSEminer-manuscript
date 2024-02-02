
# CSE-miner Webserver Tutorial
[Click here to access](cseminer.stjude.org)
## Provides a repository of highly expressed protein-coding exons as targets for antibody/CAR-based therapy.

| Pages | Features |
| --- | --- |
| 1A Table View | Visualization of exon targets and their expression |
| 1B Normalized Expression Heatmap of Candidates | Heatmap visualization of Tier1 targets in percentile |
| 1C Prevalence of Candidate | Fraction of samples with high expression |
| 2 Scatterplot View | Pan-tumor-vs-normal expression |
| 3 Gene View | Genome-level visualization of prioritized exon targets |
| 4 Heatmap View | Heatmap visualization of exon expression |

---
# Table View
The distribution of exon expression in normal tissues and tumor types can be examined in percentile (middle panel) and quartiles (bottom panel). 

<img width="834" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/6b0692e9-6fdc-4344-959d-3a03432c0c2f">

## Additional information about the columns: ##
### ExonID: Exon coordinates on the hg38 genome

### GeneName: Gene Symbol

### CandidateCategory: 
   * Tier1 candidates: high-priority candidates with limited expression in normal samples.
   * Tier2 candidates: candidates with expression in key normal tissues.
      
### Class: 
   1. Gene target: gene-level candidates
   2. AS target: alternatively spliced exon target
      
### GTEx_Normal:
   * List of normal tissue with high expression of the exon target.

### TargetDisease:
   * List of diseases that the exon can be used to target.
   
### ProteinType
   * Annotation of the protein category. ECM - extracellular matrix. 
   
### Location
   * Major protein localization categories. Matrisome, Surfaceome, and Surfaceome+Matrisome.
   
### Oncofetal
   * Confetal gene annotation that is associated with 
   
### PanCancerExprScore
   * Pan-Cancer Expression calculated based on a binned score (see figure below). 
<img width="761" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/28517151-4e2f-4ca1-88ef-769c21655fe4">

### PanNormalExprScore
   * Pan-normal Expression.

### WeightedDEScore
   * Weighted score of the differential expression between tumor and normal samples.

---
# Normalized Expression Heatmap of Exon Target 
## Provides the normalized expression value of the 157 exon targets. User can toggle between Tier1 and Tier2 target for visualization.
<img width="906" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/2078434e-06c6-412f-8ce1-78d7230b86cb">

---
# Prevalence of samples with high target expression 
<img width="983" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/6145c1c5-ed0a-423d-918b-ef04afa6cc12">

---
# ScatterPlot View
The scatter plot shows the Pan-Cancer Expression and Pan-NormalExpression Score grouped based on Tier1 and Tier2 categories.
<img width="888" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/53031ad4-23b6-4784-ba89-09adc2ed65dd">

---
# Gene View
Gene view provides the exon candidate in the genome.
<img width="1004" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/2f1739a4-2777-416f-ab5a-496d86dd2949">

---
# Heatmap View
Each column represents an exon. Heat represent the relative expression of that exon in a disease or tissue.
<img width="1008" alt="image" src="https://github.com/shawlab-moffitt/CSEminer-manuscript/assets/89986836/7faef4ba-910b-473b-bce9-b5eed8ceda15">




