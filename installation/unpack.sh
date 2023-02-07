
#unpacking the downloaded files

GTEx_FILE_targz=GTEx_7526_FPKM_final.txt.tar.gz
Ped_FILE_targz=Pediatric_Cancer_FPKM_final.txt.tar.gz
extracellular_matrix_FILE_targz=extra_cellular_matrix.tar.gz
surfaceome_FILE_gz=surfaceome.tar.gz
therapeutic_targets_FILE_targz=therapeutic_targets.tar.gz
primary_fasta_FILE_gz=GRCh38.primary_assembly.genome.fa.gz

# unpacking the GTEx file
if test -f "$GTEx_FILE_targz"; then
    echo "$GTEx_FILE_targz exists."
    tar xvfz $GTEx_FILE_targz
else
    if test -f "GTEx_7526_FPKM_final.txt"; then
        echo "GTEx_7526_FPKM_final.txt already unpacked." 
    fi
fi

if test -f "$Ped_FILE_targz"; then
    echo "$Ped_FILE_targz exists."
    tar xvfz Pediatric_Cancer_FPKM_final.txt.tar.gz
else 
    if test -f "tar xvfz Pediatric_Cancer_FPKM_final.txt"; then
        echo "Pediatric_Cancer_FPKM_final.txt already unpacked."
    fi
fi

if test -f "$Ped_FILE_targz"; then
    echo "extra_cellular_matrix.tar.gz exists."
    tar xvfz extra_cellular_matrix.tar.gz
else
    if test -f "extra_cellular_matrix"; then
        echo "extra_cellular_matrix already unpacked."
    fi
fi

if test -f "surfaceome.tar.gz"; then
    echo "surfaceome.tar.gz exists."
    tar xvfz surfaceome.tar.gz
else
    if test -f "surfaceome"; then
        echo "surfaceome already unpacked."
    fi
fi

if test -f "therapeutic_targets.tar.gz"; then
    echo "therapeutic_targets.tar.gz exists."
    tar xvfz therapeutic_targets.tar.gz
else
    if test -f "therapeutic_targets"; then
        echo "therapeutic_targets already unpacked."
    fi
fi

if test -f "GRCh38.primary_assembly.genome.fa.gz"; then
    echo "GRCh38.primary_assembly.genome.fa.gz exists."
    gunzip GRCh38.primary_assembly.genome.fa.gz
else
    if test -f "GRCh38.primary_assembly.genome.fa"; then
        echo "GRCh38.primary_assembly.genome.fa already unpacked."
    fi
fi


#tar xvfz GTEx_7526_FPKM_final.txt.tar.gz
#tar xvfz Pediatric_Cancer_FPKM_final.txt.tar.gz
#tar xvfz extra_cellular_matrix.tar.gz
#tar xvfz surfaceome.tar.gz
#tar xvfz therapeutic_targets.tar.gz
#gunzip GRCh38.primary_assembly.genome.fa.gz


