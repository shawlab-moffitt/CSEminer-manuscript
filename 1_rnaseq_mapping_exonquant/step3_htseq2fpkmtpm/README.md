# Step 3 Convert HTSEQ counts to FPKM and TPM files
This steps performs the summary of exon counts to FPKM and TPM tables.
## Installation Notes:
### Shell Command ###

g++ HTSeqcount2fpkmtpm.cpp -O3 -o HTSeqcount2fpkmtpm

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
# RHB_countfiles_example.lst PCGP_countfile.list is the list of htseqcount output count file location, e.g.
SJRHB003_D_count.txt SJRHB004_D_count.txt SJRHB005_D_count.txt
```
### Example Output ###
```
RHB-summary.txt
RHB_FPKM_final.txt
RHB_TPM_final.txt

```
