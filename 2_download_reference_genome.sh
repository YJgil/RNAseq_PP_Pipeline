#!/bin/bash

# Define URLs for the files
url_fa="https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M10/GRCm38.primary_assembly.genome.fa.gz"
url_gtf="https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M10/gencode.vM10.primary_assembly.annotation.gtf.gz"

# Define output file names
output_file_fa="GRCm38.primary_assembly.genome.fa.gz"
output_file_gtf="gencode.vM10.primary_assembly.annotation.gtf.gz"

# Download the genome assembly
echo "Downloading Genome assembly: GRCm38..."
wget "$url_fa" -O "$output_file_fa"

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Genome assembly: GRCm38 downloaded successfully."
else
    echo "Failed to download the Genome assembly: GRCm38. Please check the URL or your internet connection."
fi

# Download the genome annotation
echo "Downloading Genome annotation..."
wget "$url_gtf" -O "$output_file_gtf"

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Genome annotation downloaded successfully."
else
    echo "Failed to download the Genome annotation. Please check the URL or your internet connection."
fi