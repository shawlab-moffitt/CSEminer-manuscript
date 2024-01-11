# Perform Exon quantification 

We performed exon quantification through htseq 
 gencode.v31.primary_assembly.exon.novelexon.gtf -kL https://www.dropbox.com/s/visytv8td3ft7hk/gencode.v31.primary_assembly.exon.novelexon.gtf?dl=0
We have also included an example command for the htseq quantification

```
htseq-count -f bam -a 0 -r pos -s no -m union -t exon --nonunique all [bam file] [exon gtf file] > [output exon count file]
```
