# 3. Generating the docker for the summary procedure
The program will summarize counts displayed in Figure 1 as well as generate supplementary tables highlighted in cseminer.stjude.org
  Executing the summarization script 

## Pre-built image is available here
* https://zenodo.org/records/10582220
* [Click to download the image](https://zenodo.org/records/10582220/files/CSEminer_3_figure_data_generation.tar?download=1)


## User Configuration Requirements
| Required Packages | Version | Link to package | Notes |
| --- | --- | --- | --- | 
| DOCKER |  | [https://www.oracle.com/java/technologies/downloads/](https://docs.docker.com/engine/install/) | Required to run the docker image |

## Shell Script
```
# Command will build docker image of the summary script.
docker build . -t cseminer_example

# Command will execute docker image of the summary script.
docker run cseminer_example

# user will need to fill container id based on the container id listed locally on the user's machine
docker ps -l

# user should select the container id for cseminer_example
docker cp [container id]:/app/OutputFolder/ .

# execute the following to build the docker image
docker save -o CSEminer_3_figure_data_generation.tar cseminer_example

```
performs the final summarization, generating the counts and supplementary data tables used in the manuscript.
The Output Folder contains the following files
| Files | Descriptions |
| --- | --- |
| CSEminer_CandidateFile.txt | 157 exon candidates | 
| CSEminer_ScatterPlotFile.txt | Each row represent an exon with scores representing expression in tumor and normal samples |
| Supplementary_Table1A_Tiered_Exons_For_Publication.txt | Supplementary Table 1A 157 exons for publication | 
| Supplementary_Table1B_Tiered_Exons_For_Publication.txt | Supplementary Table 1B prioritized exons for publication |
| Supplementary_Table1C_Protein_Annotation_For_Publication.txt | Protein annotation file |



