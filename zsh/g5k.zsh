############
#  Grid5K  #
############

# Reserving resources
# Optimal Allocation of Resources (or Olivier Auguste Richard)
alias oar-1080="oarsub -q production -p \"cluster='grele'\" -l gpu=1/core=1,walltime=24 --stderr=$HOME/.cache/oar/%jobid%-err.log --stdout=$HOME/.cache/oar/%jobid%-out.log 'sleep 24h'"
alias oar-2080="oarsub -q production -p \"cluster='graffiti'\" -l gpu=1/core=1,walltime=24 --stderr=$HOME/.cache/oar/%jobid%-err.log --stdout=$HOME/.cache/oar/%jobid%-out.log 'sleep 24h'"

# completion zsh

function conda-so-activate(){ source ~/lab/conda/etc/profile.d/conda.sh; conda activate;}

# wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
# chmod +x Miniconda3-latest-Linux-x86_64.sh
# bash Miniconda2-latest-Linux-x86_64.sh
# // Home to ~/lab/conda
# conda install cudnn
