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

# Activate the conda environment
echo "Activating the Conda environment..."
source activate myenv
echo "Conda environment activated successfully."

# Step 3: Install necessary packages
echo "Installing necessary packages..."
conda install -y cudatoolkit
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
pip install -U bitsandbytes
pip install -U git+https://github.com/huggingface/transformers.git
pip install -U git+https://github.com/huggingface/peft.git
pip install -U git+https://github.com/huggingface/accelerate.git
pip install datasets
pip install scipy
sudo apt install -y cmake
sudo apt-get install -y postgresql python3-dev
sudo apt-get install --reinstall -y libpq-dev
pip install psycopg2
pip install psycopg2-binary
pip install sentencepiece
conda install -y -c conda-forge hdbscan
sudo apt-get install --reinstall -y libpq-dev
pip install tiktoken
pip install autotrain-advanced
echo "All packages installed successfully."

echo "autotrain-advances is ready now, go tran your best model!."