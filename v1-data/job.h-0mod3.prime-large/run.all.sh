#!/bin/bash
#
# run.all.sh - run all slurm jobs for h-0mod3.prime-large

# launch jobs from within the job directory
#
cd /usr/global/src/cisco/verified-prime/v1-data/job.h-0mod3.prime-large

# use sbatch of we have SLURM, else use the shell
#
export SBATCH=$(which sbatch)
if [[ -n $SBATCH ]]; then
    echo "$0: using sbatch to launch jobs: $SBATCH"
else
    echo "$0: using shell to launch jobs"
fi

# launch job for aaaaa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaaa.slurm"
else
    sh "./sbatch.aaaaa.slurm" > "jacobi.aaaaa" 2> "stderr.aaaaa"
fi

# launch job for aaaab
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaab.slurm"
else
    sh "./sbatch.aaaab.slurm" > "jacobi.aaaab" 2> "stderr.aaaab"
fi

# launch job for aaaac
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaac.slurm"
else
    sh "./sbatch.aaaac.slurm" > "jacobi.aaaac" 2> "stderr.aaaac"
fi

# launch job for aaaad
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaad.slurm"
else
    sh "./sbatch.aaaad.slurm" > "jacobi.aaaad" 2> "stderr.aaaad"
fi

# launch job for aaaae
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaae.slurm"
else
    sh "./sbatch.aaaae.slurm" > "jacobi.aaaae" 2> "stderr.aaaae"
fi

# launch job for aaaaf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaaf.slurm"
else
    sh "./sbatch.aaaaf.slurm" > "jacobi.aaaaf" 2> "stderr.aaaaf"
fi

# launch job for aaaag
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaag.slurm"
else
    sh "./sbatch.aaaag.slurm" > "jacobi.aaaag" 2> "stderr.aaaag"
fi

# launch job for aaaah
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaah.slurm"
else
    sh "./sbatch.aaaah.slurm" > "jacobi.aaaah" 2> "stderr.aaaah"
fi

# launch job for aaaai
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaai.slurm"
else
    sh "./sbatch.aaaai.slurm" > "jacobi.aaaai" 2> "stderr.aaaai"
fi

# launch job for aaaaj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaaj.slurm"
else
    sh "./sbatch.aaaaj.slurm" > "jacobi.aaaaj" 2> "stderr.aaaaj"
fi

# launch job for aaaak
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaak.slurm"
else
    sh "./sbatch.aaaak.slurm" > "jacobi.aaaak" 2> "stderr.aaaak"
fi

# launch job for aaaal
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaal.slurm"
else
    sh "./sbatch.aaaal.slurm" > "jacobi.aaaal" 2> "stderr.aaaal"
fi

# launch job for aaaam
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaam.slurm"
else
    sh "./sbatch.aaaam.slurm" > "jacobi.aaaam" 2> "stderr.aaaam"
fi

# launch job for aaaan
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaan.slurm"
else
    sh "./sbatch.aaaan.slurm" > "jacobi.aaaan" 2> "stderr.aaaan"
fi

# launch job for aaaao
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaao.slurm"
else
    sh "./sbatch.aaaao.slurm" > "jacobi.aaaao" 2> "stderr.aaaao"
fi

# launch job for aaaap
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaap.slurm"
else
    sh "./sbatch.aaaap.slurm" > "jacobi.aaaap" 2> "stderr.aaaap"
fi

# launch job for aaaaq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaaq.slurm"
else
    sh "./sbatch.aaaaq.slurm" > "jacobi.aaaaq" 2> "stderr.aaaaq"
fi

# launch job for aaaar
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaar.slurm"
else
    sh "./sbatch.aaaar.slurm" > "jacobi.aaaar" 2> "stderr.aaaar"
fi

# launch job for aaaas
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaas.slurm"
else
    sh "./sbatch.aaaas.slurm" > "jacobi.aaaas" 2> "stderr.aaaas"
fi

# launch job for aaaat
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaat.slurm"
else
    sh "./sbatch.aaaat.slurm" > "jacobi.aaaat" 2> "stderr.aaaat"
fi

# launch job for aaaau
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaau.slurm"
else
    sh "./sbatch.aaaau.slurm" > "jacobi.aaaau" 2> "stderr.aaaau"
fi

# launch job for aaaav
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaav.slurm"
else
    sh "./sbatch.aaaav.slurm" > "jacobi.aaaav" 2> "stderr.aaaav"
fi

# launch job for aaaaw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaaw.slurm"
else
    sh "./sbatch.aaaaw.slurm" > "jacobi.aaaaw" 2> "stderr.aaaaw"
fi

# launch job for aaaax
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaax.slurm"
else
    sh "./sbatch.aaaax.slurm" > "jacobi.aaaax" 2> "stderr.aaaax"
fi

# launch job for aaaay
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaay.slurm"
else
    sh "./sbatch.aaaay.slurm" > "jacobi.aaaay" 2> "stderr.aaaay"
fi

# launch job for aaaaz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaaz.slurm"
else
    sh "./sbatch.aaaaz.slurm" > "jacobi.aaaaz" 2> "stderr.aaaaz"
fi

# launch job for aaaba
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaba.slurm"
else
    sh "./sbatch.aaaba.slurm" > "jacobi.aaaba" 2> "stderr.aaaba"
fi

# launch job for aaabb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabb.slurm"
else
    sh "./sbatch.aaabb.slurm" > "jacobi.aaabb" 2> "stderr.aaabb"
fi

# launch job for aaabc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabc.slurm"
else
    sh "./sbatch.aaabc.slurm" > "jacobi.aaabc" 2> "stderr.aaabc"
fi

# launch job for aaabd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabd.slurm"
else
    sh "./sbatch.aaabd.slurm" > "jacobi.aaabd" 2> "stderr.aaabd"
fi

# launch job for aaabe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabe.slurm"
else
    sh "./sbatch.aaabe.slurm" > "jacobi.aaabe" 2> "stderr.aaabe"
fi

# launch job for aaabf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabf.slurm"
else
    sh "./sbatch.aaabf.slurm" > "jacobi.aaabf" 2> "stderr.aaabf"
fi

# launch job for aaabg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabg.slurm"
else
    sh "./sbatch.aaabg.slurm" > "jacobi.aaabg" 2> "stderr.aaabg"
fi

# launch job for aaabh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabh.slurm"
else
    sh "./sbatch.aaabh.slurm" > "jacobi.aaabh" 2> "stderr.aaabh"
fi

# launch job for aaabi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabi.slurm"
else
    sh "./sbatch.aaabi.slurm" > "jacobi.aaabi" 2> "stderr.aaabi"
fi

# launch job for aaabj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabj.slurm"
else
    sh "./sbatch.aaabj.slurm" > "jacobi.aaabj" 2> "stderr.aaabj"
fi

# launch job for aaabk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabk.slurm"
else
    sh "./sbatch.aaabk.slurm" > "jacobi.aaabk" 2> "stderr.aaabk"
fi

# launch job for aaabl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabl.slurm"
else
    sh "./sbatch.aaabl.slurm" > "jacobi.aaabl" 2> "stderr.aaabl"
fi

# launch job for aaabm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabm.slurm"
else
    sh "./sbatch.aaabm.slurm" > "jacobi.aaabm" 2> "stderr.aaabm"
fi

# launch job for aaabn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabn.slurm"
else
    sh "./sbatch.aaabn.slurm" > "jacobi.aaabn" 2> "stderr.aaabn"
fi

# launch job for aaabo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabo.slurm"
else
    sh "./sbatch.aaabo.slurm" > "jacobi.aaabo" 2> "stderr.aaabo"
fi

# launch job for aaabp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabp.slurm"
else
    sh "./sbatch.aaabp.slurm" > "jacobi.aaabp" 2> "stderr.aaabp"
fi

# launch job for aaabq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabq.slurm"
else
    sh "./sbatch.aaabq.slurm" > "jacobi.aaabq" 2> "stderr.aaabq"
fi

# launch job for aaabr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabr.slurm"
else
    sh "./sbatch.aaabr.slurm" > "jacobi.aaabr" 2> "stderr.aaabr"
fi

# launch job for aaabs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabs.slurm"
else
    sh "./sbatch.aaabs.slurm" > "jacobi.aaabs" 2> "stderr.aaabs"
fi

# launch job for aaabt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabt.slurm"
else
    sh "./sbatch.aaabt.slurm" > "jacobi.aaabt" 2> "stderr.aaabt"
fi

# launch job for aaabu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabu.slurm"
else
    sh "./sbatch.aaabu.slurm" > "jacobi.aaabu" 2> "stderr.aaabu"
fi

# launch job for aaabv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabv.slurm"
else
    sh "./sbatch.aaabv.slurm" > "jacobi.aaabv" 2> "stderr.aaabv"
fi

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
