# Procedure for RNAseq mapping and exon quantification
  1. RNAseq mapping using STAR
  2. Exon quantification with HTSEQ
  3. Code to normalize exons to FPKM

# Step 1.1 RNAseq mapping

The following command was used to perform RNAseq mapping. 
| Required programs | Version number |
| --- | --- |
| STAR | 2.7.1a |

The following include required input files
| Inputs | note |
| --- | --- |
| fastq files | place the paired files in ${ALL_READ1} and ${ALL_READ2} |

The following references are necessary for the following parameters
| Parameters | note |
| --- | --- |
| User specified STAR index folder | specify folder path in --genomeDIR |

```


STAR --readFilesIn ${ALL_READ1} ${ALL_READ2} \
     --runThreadN 1 \
     --genomeDir [User specified STAR Index folder] \
     --outFilterType BySJout \
     --outFilterMultimapNmax 20 \
     --alignSJoverhangMin 8 \
     --alignSJstitchMismatchNmax 5 -1 5 5 \
     --alignSJDBoverhangMin 10 \
     --outFilterMismatchNmax 999 \
     --outFilterMismatchNoverReadLmax 0.04 \
     --alignIntronMin 20 \
     --alignIntronMax 100000 \
     --alignMatesGapMax 100000 \
     --genomeLoad NoSharedMemory \
     --outFileNamePrefix ${OUTPUT_PREFIX}. \
     --outSAMmapqUnique 60 \
     --outSAMmultNmax 1 \
     --outSAMstrandField intronMotif \
     --outSAMtype BAM SortedByCoordinate \
     --outReadsUnmapped None \
     --outSAMattrRGline ID:${RG_ID} LB:${RG_LB} PL:${RG_PL} SM:${RG_SM} PU:${RG_PU} \
     --chimSegmentMin 12 \
     --chimJunctionOverhangMin 12 \
     --chimSegmentReadGapMax 3 \
     --chimMultimapNmax 10 \
     --chimMultimapScoreRange 10 \
     --chimNonchimScoreDropMin 10 \
     --chimOutJunctionFormat 1 \
     --quantMode TranscriptomeSAM GeneCounts \
     --twopassMode Basic \
     --peOverlapNbasesMin 12 \
     --peOverlapMMp 0.1 \
     --outWigType wiggle \
     --outWigStrand Stranded \
     --outWigNorm RPM \
     --limitBAMsortRAM 160000000000 \
     --outSAMunmapped Within
```

# Step 1.2 Exon quantification 

Exon quantification was performed through htseq.
The following input files are necessary.
| Input | Note |
| --- | --- |
| BAM File derived from Step 1.1 | bam index is necessary |


The following reference file is needed.
| References | URL |
| --- | --- |
| gencode.v31.primary_assembly.exon.novelexon.gtf | https://www.dropbox.com/s/visytv8td3ft7hk/gencode.v31.primary_assembly.exon.novelexon.gtf?dl=1 |

The following command was run 
```
htseq-count -f bam -a 0 -r pos -s no -m union -t exon --nonunique all [bam file] [exon gtf file] > [output exon count file]
```

