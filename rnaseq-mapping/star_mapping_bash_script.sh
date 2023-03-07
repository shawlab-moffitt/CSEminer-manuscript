#setcbenv prod     
module load java/1.8.0_66
#cbload --set official 
#https://wiki.stjude.org/pages/viewpage.action?pageId=37521095

module load star/2.7.1a
#module load picard/2.9.4
#module load samtools/1.4

ALL_READ1=$1
ALL_READ2=$2
OUTPUT_PREFIX=$3

STAR --readFilesIn ${ALL_READ1} ${ALL_READ2} \
     --runThreadN 1 \
     --genomeDir /research/rgs01/applications/hpcf/authorized_apps/cab/Automation/REF/Homo_sapiens/Gencode/r19/STAR-index/2.7/ \
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

#java -jar /hpcf/apps/picard/install/2.9.4/picard.jar MarkDuplicates INPUT=${OUTPUT_PREFIX}Aligned.sortedByCoord.out.bam OUTPUT=${OUTPUT_PREFIX}.markdup.bam METRICS_FILE=${OUTPUT_PREFIX}.markdup.metrics REMOVE_DUPLICATES=false ASSUME_SORTED=true CREATE_INDEX=true

#samtools flagstat ${OUTPUT_PREFIX}.markdup.bam >${OUTPUT_PREFIX}.markdup.bam.flagstat

