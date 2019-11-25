############
#  Grid5K  #
############

# Reserving resources OAR Stuff + some alias
# Optimal Allocation of Resources (or Olivier Auguste Richard)

# JOB reservation through ORA
# this function takes 1 arg, the amount walltime of the job.
# The job submission will ask for 3 time this amount.
# And scale back to time passed in the arg.
# This allows to extant the walltime of job, which is not allowed on the
# g5k/nancy/production clusters.
#
# call this function through oar-xxx to select the CLUSTER.
_my-oar(){
  walltime=$1
  walltime_justtobesafe=$(($walltime * 3))
  shift 1
  jobid=$(oarsub -q production -p "cluster='$CLUSTER'" -l walltime="$walltime_justtobesafe":40 --stderr=$HOME/.cache/oar/%jobid%-err.log --stdout=$HOME/.cache/oar/%jobid%-out.log 'sleep 10d' $@ | grep "OAR_JOB_ID" | sed 's/[^0123456789]//g')
  if [[ "$@" != "" ]]; then # in case of reservations (-r)
    return
  fi
  echo "Waiting for this job to be ready!"
  tput sc
  while [ $(oarstat -u | grep "$jobid" | awk '{print $5}') != "R" ]; do
    output=$(oarstat -u | grep "$jobid")
    tput rc; tput el
    echo $output
    sleep 0.40
  done
  tput rc; tput ed;
  oarwalltime $jobid -$(($walltime * 2)):00 # fake-it ;P
  oarwalltime $jobid
}

function oar-1080(){
  CLUSTER='grele'
  _my-oar $@
}
function oar-2080(){
  CLUSTER='graffiti'
  _my-oar $@
}

alias oarwatch="watch -n 1 oarstat -u"

# activate conda venv
# Works on both g5k and laptop

function conda-so-activate(){
  if [[ $(hostname) == "xps-13" ]]; then
     source ~/lab/python/espnet/tools/venv/etc/profile.d/conda.sh
   else
     source ~/lab/espnet/tools/venv/etc/profile.d/conda.sh
  fi
  conda activate;
}

# Predefined drawgantt filters
#   Only show the GPU I'm interested into using
#   Print last hour of jobs and 24 hour ahead

function gg5k(){
  firefox --new-tab "https://intranet.grid5000.fr/oar/Nancy/drawgantt-svg-prod/drawgantt-svg.php?width=1400&filter=comment%20NOT%20LIKE%20%27Retired%20since%%27%20AND%20gpu%20%3E%200%20AND%20type=%27default%27%20and%20production=%27YES%27AND%20cluster!=%27graphique%27%20AND%20cluster!=%27graphite%27%20&timezone=Europe/Paris&resource_base=host&scale=10&config=prod&scale=20&width=1400&start=$(date +%s  --date='-2 hour')&stop=$(date +%s  --date='+24 hour')"
}

# completion zsh

# see my-fzf-completion() in zsh/completion.zsh
_fzf-compl-oar(){
    fzf="$(__fzfcmd_complete)"
    preview='oarstat -j $(echo {}) -p | oarprint core -P host,gpu_model,gpu_count,cputype,memnode -F "$(tput bold) %$(tput sgr0) -| GPU=\"%\"x% CPU=\"%\" MEM=%MB |-" -f -'
    matches=$(command oarstat -u | \
      FZF_DEFAULT_OPTS=" --header-lines=2 --min-height 15 --reverse --preview '$preview' --preview-window top:1:wrap $FZF_DEFAULT_OPTS" ${=fzf} -m | \
      awk '{print $1}' | tr '\n' ' ')
    if [ -n "$matches" ]; then
      LBUFFER="$LBUFFER$matches"
    fi
}
