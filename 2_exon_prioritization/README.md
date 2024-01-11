# Custom Procedure 2. Perform Exon Scoring for Prioritization
## 2.1. Downloading of the references and input files.
## 2.2. Calculate the Exon Enrichment Scores.
## 2.3. Merge Exon Scores from Solid and Brain Tumors.
## 2.4. Annotate Putatively Spliced Exons.

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
| | |
| gencode.v35.primary_assembly.annotation.gtf | https://www.dropbox.com/s/bc0fii0jsccwpie/gencode.v35.primary_assembly.annotation.gtf?dl=1 | GTF file containing the exon-transcripts |

```
sh step2_exon_prioritization_example.sh

# the shell script performs the following command
drppm -CSEminerPrioritizationScript Comprehensive_Exon_Annotations_20220217.txt gencode.v35.primary_assembly.annotation.gtf Output_Exon_AS_Annotations.txt Output_Exon_Annotations.txt
```

Finally, the exons are then manually reviewed to identify alternatively spliced exons. 


