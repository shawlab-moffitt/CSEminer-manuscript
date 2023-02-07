
path2currentdirectory=`pwd`/input_and_references

echo "#CSI-Miner_BrainTumorOnly.param" > CSI-Miner_BrainTumorOnly.param

echo "## CSI Miner parameter input file" >> CSI-Miner_BrainTumorOnly.param

echo "###################" >> CSI-Miner_BrainTumorOnly.param
echo "# Core Input File #" >> CSI-Miner_BrainTumorOnly.param
echo "CANCER_EXON_MATRIX = "$path2currentdirectory"/Pediatric_Cancer_FPKM_final.txt" >> CSI-Miner_BrainTumorOnly.param
echo "NORM_EXON_MATRIX = "$path2currentdirectory"/GTEx_7526_FPKM_final.txt" >> CSI-Miner_BrainTumorOnly.param
echo "QUERY_GENELIST = "$path2currentdirectory"/complete_surfaceome_updated_20211114.txt"  >> CSI-Miner_BrainTumorOnly.param
echo "CANCER_SAMPLE2DISEASETYPE = "$path2currentdirectory"/Diagnosis_Brain_Clinical_PCGP_TARGET_Sample2DiseaseType_Updated.txt"  >> CSI-Miner_BrainTumorOnly.param
echo "NORM_SAMPLE2TISSUETYPE = "$path2currentdirectory"/GTEx_SampleID2Histology_updated.txt" >> CSI-Miner_BrainTumorOnly.param

echo "# Name that will be used in the pipeline" >> CSI-Miner_BrainTumorOnly.param
echo "#CANCER_PREFIX = PCGP_TARGET_Clinical" >> CSI-Miner_BrainTumorOnly.param
echo "#NORM_PREFIX = GTEx" >> CSI-Miner_BrainTumorOnly.param
echo "###################" >> CSI-Miner_BrainTumorOnly.param


echo "## Additional Parameter ## " >> CSI-Miner_BrainTumorOnly.param
echo "MATRIXDB_CORE = "$path2currentdirectory"/extra_cellular_matrix/matrixdb_CORE.tab" >> CSI-Miner_BrainTumorOnly.param
echo "THERAPEUTIC_TARGET = "$path2currentdirectory"/therapeutic_targets/therpeutic_target.txt" >> CSI-Miner_BrainTumorOnly.param
echo "SURFACEOME = "$path2currentdirectory"/surfaceome/pnas/experiment.txt" >> CSI-Miner_BrainTumorOnly.param

echo "EXON_APPRIS = "$path2currentdirectory"/Gencode36_Ensembl102_ApprisExonAnnotation.txt" >> CSI-Miner_BrainTumorOnly.param
echo "OTHER_EXON_ANNOTATION = "$path2currentdirectory"/OtherExonAnnotation.txt.csv" >> CSI-Miner_BrainTumorOnly.param

echo "PRIMARY_ASSEMBLY_FASTA = "$path2currentdirectory"/GRCh38.primary_assembly.genome.fa" >> CSI-Miner_BrainTumorOnly.param
echo "UNIPROT_FASTA = "$path2currentdirectory"/Homo_sapiens_uniprot_sprot_combined.fasta" >> CSI-Miner_BrainTumorOnly.param




echo "#CSI-Miner_SolidTumorOnly.param" > CSI-Miner_SolidTumorOnly.param

echo "## CSI Miner parameter input file" >> CSI-Miner_SolidTumorOnly.param

echo "###################" >> CSI-Miner_SolidTumorOnly.param
echo "# Core Input File #" >> CSI-Miner_SolidTumorOnly.param
echo "CANCER_EXON_MATRIX = "$path2currentdirectory"/Pediatric_Cancer_FPKM_final.txt" >> CSI-Miner_SolidTumorOnly.param
echo "NORM_EXON_MATRIX = "$path2currentdirectory"/GTEx_7526_FPKM_final.txt" >> CSI-Miner_SolidTumorOnly.param
echo "QUERY_GENELIST = "$path2currentdirectory"/complete_surfaceome_updated_20211114.txt"  >> CSI-Miner_SolidTumorOnly.param
echo "CANCER_SAMPLE2DISEASETYPE = "$path2currentdirectory"/Diagnosis_Solid_Clinical_PCGP_TARGET_Sample2DiseaseType_Updated.txt"  >> CSI-Miner_SolidTumorOnly.param
echo "NORM_SAMPLE2TISSUETYPE = "$path2currentdirectory"/GTEx_SampleID2Histology_updated.txt" >> CSI-Miner_SolidTumorOnly.param

echo "# Name that will be used in the pipeline" >> CSI-Miner_SolidTumorOnly.param
echo "#CANCER_PREFIX = PCGP_TARGET_Clinical" >> CSI-Miner_SolidTumorOnly.param
echo "#NORM_PREFIX = GTEx" >> CSI-Miner_SolidTumorOnly.param
echo "###################" >> CSI-Miner_SolidTumorOnly.param


echo "## Additional Parameter ## " >> CSI-Miner_SolidTumorOnly.param
echo "MATRIXDB_CORE = "$path2currentdirectory"/extra_cellular_matrix/matrixdb_CORE.tab" >> CSI-Miner_SolidTumorOnly.param
echo "THERAPEUTIC_TARGET = "$path2currentdirectory"/therapeutic_targets/therpeutic_target.txt" >> CSI-Miner_SolidTumorOnly.param
echo "SURFACEOME = "$path2currentdirectory"/surfaceome/pnas/experiment.txt" >> CSI-Miner_SolidTumorOnly.param

echo "EXON_APPRIS = "$path2currentdirectory"/Gencode36_Ensembl102_ApprisExonAnnotation.txt" >> CSI-Miner_SolidTumorOnly.param
echo "OTHER_EXON_ANNOTATION = "$path2currentdirectory"/OtherExonAnnotation.txt.csv" >> CSI-Miner_SolidTumorOnly.param

echo "PRIMARY_ASSEMBLY_FASTA = "$path2currentdirectory"/GRCh38.primary_assembly.genome.fa" >> CSI-Miner_SolidTumorOnly.param
echo "UNIPROT_FASTA = "$path2currentdirectory"/Homo_sapiens_uniprot_sprot_combined.fasta" >> CSI-Miner_SolidTumorOnly.param


