# autotrain_setup
A setup repo to setup autotrain-advance library for fine tunning llm on any dataset

```
git clone https://github.com/pankajarm/autotrain_setup.git
cd autotrain_setup
```

Step1: install the mininconda

```
bash install_miniconda.sh
```

Close the terminal and open again, It should show (base) into new terminal, it mean base conda environment is ready


Step2: Setup your new conda envrionment
```
bash setup_conda.sh

```

Step3: Install all libraries and autotrain-advanced

```
bash setup_autotrain.sh
```

if any issues running script with bash, provide right permissions

```
chmod +x install_miniconda.sh
./install_miniconda.sh
```


```
chmod +x setup_conda.sh
./setup_conda.sh
```


```
chmod +x setup_autotrain.sh
./setup_autotrain.sh
```

Now, run trainer.py

```
python trainer.py

```
