#!/bin/bash

# Add conda channels and set channel priority
echo "Adding conda channels..."
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

# Function to install a tool using conda
install_tool() {
    local tool_name=$1
    echo "Installing $tool_name..."
    conda install -y -c bioconda "$tool_name"
    if [ $? -eq 0 ]; then
        echo "$tool_name has been successfully installed."
    else
        echo "Failed to install $tool_name. Please check your conda installation."
        exit 1
    fi
}

# Check if STAR is installed
if ! command -v STAR &> /dev/null; then
    install_tool "star"
else
    echo "STAR is already installed."
fi

# Check if featureCounts from subread is installed
if ! command -v featureCounts &> /dev/null; then
    install_tool "subread"
else
    echo "subread is already installed."
fi