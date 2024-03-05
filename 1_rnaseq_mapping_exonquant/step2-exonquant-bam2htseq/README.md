# Step 1.2 Exon quantification 

| Required programs | Version number |
| --- | --- |
| HTSEQ | 0.11.2 |

Exon quantification was performed through htseq.
The following input files are necessary.
| Input | Note |
| --- | --- |
| BAM File derived from Step 1.1 | bam index is necessary |

The following reference file is needed.
| References | URL |
| --- | --- |
| gencode.v31.primary_assembly.exon.novelexon.gtf | https://zenodo.org/records/10783179/files/gencode.v31.primary_assembly.exon.novelexon.gtf?download=1 |

The following command was run 
```
htseq-count -f bam -a 0 -r pos -s no -m union -t exon --nonunique all [bam file] [exon gtf file] > [output exon count file]
```
