# 3. Procedure for summarizing the data 
The program will summarize counts displayed in Figure 1 as well as generate supplementary tables highlighted in cseminer.stjude.org
  Executing the summarization script 

## A pre-built docker image of the analysis is available here
* https://zenodo.org/records/10594740
* [Click to download the image](https://zenodo.org/records/10594740/files/CSEminer_3_figure_data_generation.tar?download=1)

## User Configuration Requirements
| Required Packages | Version | Link to package | Notes |
| --- | --- | --- | --- | 
| JAVA | > J2SE-1.5 | https://www.oracle.com/java/technologies/downloads/ | Required to execute the DRPPM jar program |
| DRPPM Package | 20240112 | https://github.com/gatechatl/DRPPM/raw/master/export/DRPPM_20240112A_newmachine.jar | The library wraps the code for execution |

## Shell Script
```
## Unpack the zip files
mkdir CompleteAnnotationPipeline

unzip pipeline_input_files.zip

mv pipeline_input_files CompleteAnnotationPipeline/pipeline_input_files

mkdir OutputFolder

## update the local drppm to make it executable.
chmod u+x drppm

## Execute the code
java -Xmx64g -XX:-UseGCOverheadLimit -jar DRPPM_20240112A_newmachine.jar -CSEminerFigure1ExonClassificationFullPipelineExecMode CompleteAnnotationPipeline/ OutputFolder
```
The program performs the final summarization, generating the counts and supplementary data tables used in the manuscript.

The Output Folder contains the following files
| Files | Descriptions |
| --- | --- |
| CSEminer_CandidateFile.txt | 157 exon candidates | 
| CSEminer_ScatterPlotFile.txt | Each row represent an exon with scores representing expression in tumor and normal samples |
| Supplementary_Table1A_Tiered_Exons_For_Publication.txt | Supplementary Table 1A 157 exons for publication | 
| Supplementary_Table1B_Tiered_Exons_For_Publication.txt | Supplementary Table 1B prioritized exons for publication |
| Supplementary_Table1C_Protein_Annotation_For_Publication.txt | Protein annotation file |

## Source code of the docker build is available here
* https://github.com/shawlab-moffitt/CSEminer-manuscript-generate-docker-images/tree/main
