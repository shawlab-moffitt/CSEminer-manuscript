# Execute the htseq quantification
#htseq-count -f bam -a 0 -r pos -s no -m union -t exon --nonunique all SJMEL001033_D1.STAR.Aligned.sortedByCoord.out.bam /research/rgs01/project_space/zhanggrp/MethodDevelopment/common/ExonLevelQuantificationPipeline/Reference/ExonLevel_nosplit/gencode.v31.primary_assembly.exon.novelexon.gtf >SJMEL001033_D1_count.txt

htseq-count -f bam -a 0 -r pos -s no -m union -t exon --nonunique all [bam file] [exon gtf file] > [output exon count file]
