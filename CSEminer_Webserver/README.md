
CSE-miner 
Provides a repository of highly expressed protein-coding exons as targets for antibody/CAR-based therapy.

**Table View**

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
