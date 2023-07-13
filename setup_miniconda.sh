#!/bin/bash

# Step 1: Install miniconda
echo "Installing Miniconda..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
echo "Miniconda installed successfully."

# Step 2: Create a new conda environment
echo "Creating a new Conda environment..."
conda create -y -n autotrain_env python=3.9.0
echo "Conda environment created successfully."