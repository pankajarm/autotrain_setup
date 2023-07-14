#!/bin/bash

# Step 1: Install necessary packages
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

# Step 2: Install Git LFS
echo "Installing Git LFS..."
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install -y git-lfs
git lfs install
echo "Git LFS installed successfully."

# Step 3: Install autotrain-advanced
echo "Installing autotrain-advanced..."
pip install autotrain-advanced
echo "Autotrain-advanced installed successfully."

echo "Script finished successfully."
