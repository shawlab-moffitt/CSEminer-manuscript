# Step 1.3 Convert HTSEQ counts to FPKM and TPM files
This steps performs the summary of exon counts to FPKM and TPM tables.

## Required Programs 
| Required Packages | Version | 
| --- | --- |
| GCC compiler | 9.1.0 |

## Installation Notes:
### Shell Command ###
```
g++ HTSeqcount2fpkmtpm.cpp -O3 -o HTSeqcount2fpkmtpm
```
| Required Input Files | Example Files | Note |
| --- | --- | --- |
| A list of htseq count files | RHB_countfiles_example.lst | NA |

## Execution Example
### Shell Script ###
```
./HTSeqcount2fpkmtpm RHB_countfiles_example.lst 101 RHB
```
### Other Notes ###
```
# RHB_countfiles_example.lst is the list of htseqcount output count file location, e.g.
'$path to the work directory$'/ExampleFiles/SJRHB003_D_count.txt
'$path to the work directory$'/ExampleFiles/SJRHB004_D_count.txt
'$path to the work directory$'/ExampleFiles/SJRHB005_D_count.txt
# 101 is the read length
# RHB is the prefix for output files
```
### Example Output ###
```
RHB-summary.txt # summary table, each row is a sample, columns includes features from htseq-count output, i.e. "Sample","Mapped","no_feature","ambiguous","too_low_aQual","not_aligned","alignment_not_unique"
RHB_FPKM_final.txt # FPKM matrix
RHB_TPM_final.txt # TPM matrix

```
