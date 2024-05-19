#!/bin/bash

# Unzip downloaded files
echo "Unzipping downloaded files..."
gunzip *.gz

# Create directory for reference files
mkdir -p ref

# Run STAR command
STAR --runMode genomeGenerate \
     --genomeDir ref/ \
     --genomeFastaFiles GRCm38.primary_assembly.genome.fa \
     --sjdbGTFfile gencode.vM10.primary_assembly.annotation.gtf \
     --runThreadN 16

# Check if STAR command was successful
if [ $? -eq 0 ]; then
    echo "STAR command completed successfully."
else
    echo "Failed to execute STAR command. Please check the input files or parameters."
fi