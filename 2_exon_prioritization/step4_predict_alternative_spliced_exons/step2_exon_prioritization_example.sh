if test -f "Comprehensive_Exon_Annotations_20220217.txt.gz"; then
    gunzip Comprehensive_Exon_Annotations_20220217.txt.gz
fi

if test -f "gencode.v35.primary_assembly.annotation.gtf"; then
    curl --output gencode.v35.primary_assembly.annotation.gtf -kL https://www.dropbox.com/s/bc0fii0jsccwpie/gencode.v35.primary_assembly.annotation.gtf?dl=1
fi
drppm -CSEminerPrioritizationScript Comprehensive_Exon_Annotations_20220217.txt gencode.v35.primary_assembly.annotation.gtf Output_Exon_AS_Annotations.txt Output_Exon_Annotations.txt
