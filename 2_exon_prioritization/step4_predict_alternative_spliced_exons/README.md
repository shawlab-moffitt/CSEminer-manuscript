# Annotate putatively spliced exons
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
