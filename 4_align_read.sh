#!/bin/bash

# Function to run STAR alignment for a sample
run_star_alignment() {
    local sample=$1
    local fastq_file_1="fastq/${sample}_1.fastq"
    local fastq_file_2="fastq/${sample}_2.fastq"

    # Check if both _1.fastq and _2.fastq files exist for the sample
    if [ -f "$fastq_file_1" ] && [ -f "$fastq_file_2" ]; then
        echo "Running STAR alignment for sample: $sample"
        STAR --runMode alignReads \
             --genomeDir ref/ \
             --outSAMtype BAM SortedByCoordinate \
             --readFilesIn "$fastq_file_1" "$fastq_file_2" \
             --outFileNamePrefix "bam/${sample}_" \
             --runThreadN 12
    else
        echo "Skipping sample $sample: Missing _1.fastq or _2.fastq file"
    fi
}

# Run STAR alignment for each unique sample
for fastq_file_1 in fastq/*_1.fastq; do
    # Extract sample name from the file name
    sample=$(basename "$fastq_file_1" "_1.fastq")
    run_star_alignment "$sample"
done