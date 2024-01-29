# 3. Procedure for summarizing the data 
The program will summarize counts displayed in Figure 1 as well as generate supplementary tables highlighted in cseminer.stjude.org
  1. Download the pipeline data.
  2. Download the DRPPM jar package
  3. Execute the summarization script that is available [here](https://github.com/gatechatl/DRPPM/blob/master/src/rnaseq/splicing/cseminer/prioritization/CSEminerFigure1ExonClassificationFullPipelineExecMode.java)

## User Configuration Requirements
| Required Packages | Version | Link to package | Notes |
| --- | --- | --- | --- | 
| JAVA | > J2SE-1.5 | https://www.oracle.com/java/technologies/downloads/ | Required to execute the DRPPM jar program |
| DRPPM Package | 20240112 | https://github.com/gatechatl/DRPPM/raw/master/export/DRPPM_20240112A_newmachine.jar | The library wraps the code for execution |

## Shell Script
```
## download the files from dropbox 
curl --output pipeline_input_files.zip -kL https://www.dropbox.com/scl/fi/cem2argxukr5fqlb49m0k/pipeline_input_files.zip?rlkey=3wzegacn26m0sphz0bnsccu9b&dl=0
## download the DRPPM library package 
curl --output DRPPM_20240112A_newmachine.jar -kL https://github.com/gatechatl/DRPPM/raw/master/export/DRPPM_20240112A_newmachine.jar
## Unpack the zip files
mkdir CompleteAnnotationPipeline

unzip pipeline_input_files.zip

mv pipeline_input_files CompleteAnnotationPipeline/pipeline_input_files

mkdir OutputFolder

## update the local drppm to make it executable.
chmod u+x drppm

## Execute the code
./drppm -CSEminerFigure1ExonClassificationFullPipelineExecMode CompleteAnnotationPipeline/ OutputFolder
```
The program performs the final summarization, generating the counts and supplementary data tables used in the manuscript.


