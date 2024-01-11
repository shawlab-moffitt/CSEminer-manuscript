# Step 1 perform RNAseq mapping

The user can perform RNAseq mapping using the following command.

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
