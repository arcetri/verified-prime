#!/bin/bash
#
# run.all.sh - run all slurm jobs for h-0mod3.n-12776050

# launch jobs from within the job directory
#
cd /usr/global/src/cisco/verified-prime/v1-data/job.h-0mod3.n-12776050

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

# launch job for aaabw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabw.slurm"
else
    sh "./sbatch.aaabw.slurm" > "jacobi.aaabw" 2> "stderr.aaabw"
fi

# launch job for aaabx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabx.slurm"
else
    sh "./sbatch.aaabx.slurm" > "jacobi.aaabx" 2> "stderr.aaabx"
fi

# launch job for aaaby
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaby.slurm"
else
    sh "./sbatch.aaaby.slurm" > "jacobi.aaaby" 2> "stderr.aaaby"
fi

# launch job for aaabz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaabz.slurm"
else
    sh "./sbatch.aaabz.slurm" > "jacobi.aaabz" 2> "stderr.aaabz"
fi

# launch job for aaaca
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaca.slurm"
else
    sh "./sbatch.aaaca.slurm" > "jacobi.aaaca" 2> "stderr.aaaca"
fi

# launch job for aaacb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacb.slurm"
else
    sh "./sbatch.aaacb.slurm" > "jacobi.aaacb" 2> "stderr.aaacb"
fi

# launch job for aaacc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacc.slurm"
else
    sh "./sbatch.aaacc.slurm" > "jacobi.aaacc" 2> "stderr.aaacc"
fi

# launch job for aaacd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacd.slurm"
else
    sh "./sbatch.aaacd.slurm" > "jacobi.aaacd" 2> "stderr.aaacd"
fi

# launch job for aaace
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaace.slurm"
else
    sh "./sbatch.aaace.slurm" > "jacobi.aaace" 2> "stderr.aaace"
fi

# launch job for aaacf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacf.slurm"
else
    sh "./sbatch.aaacf.slurm" > "jacobi.aaacf" 2> "stderr.aaacf"
fi

# launch job for aaacg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacg.slurm"
else
    sh "./sbatch.aaacg.slurm" > "jacobi.aaacg" 2> "stderr.aaacg"
fi

# launch job for aaach
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaach.slurm"
else
    sh "./sbatch.aaach.slurm" > "jacobi.aaach" 2> "stderr.aaach"
fi

# launch job for aaaci
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaci.slurm"
else
    sh "./sbatch.aaaci.slurm" > "jacobi.aaaci" 2> "stderr.aaaci"
fi

# launch job for aaacj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacj.slurm"
else
    sh "./sbatch.aaacj.slurm" > "jacobi.aaacj" 2> "stderr.aaacj"
fi

# launch job for aaack
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaack.slurm"
else
    sh "./sbatch.aaack.slurm" > "jacobi.aaack" 2> "stderr.aaack"
fi

# launch job for aaacl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacl.slurm"
else
    sh "./sbatch.aaacl.slurm" > "jacobi.aaacl" 2> "stderr.aaacl"
fi

# launch job for aaacm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacm.slurm"
else
    sh "./sbatch.aaacm.slurm" > "jacobi.aaacm" 2> "stderr.aaacm"
fi

# launch job for aaacn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacn.slurm"
else
    sh "./sbatch.aaacn.slurm" > "jacobi.aaacn" 2> "stderr.aaacn"
fi

# launch job for aaaco
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaco.slurm"
else
    sh "./sbatch.aaaco.slurm" > "jacobi.aaaco" 2> "stderr.aaaco"
fi

# launch job for aaacp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacp.slurm"
else
    sh "./sbatch.aaacp.slurm" > "jacobi.aaacp" 2> "stderr.aaacp"
fi

# launch job for aaacq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacq.slurm"
else
    sh "./sbatch.aaacq.slurm" > "jacobi.aaacq" 2> "stderr.aaacq"
fi

# launch job for aaacr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacr.slurm"
else
    sh "./sbatch.aaacr.slurm" > "jacobi.aaacr" 2> "stderr.aaacr"
fi

# launch job for aaacs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacs.slurm"
else
    sh "./sbatch.aaacs.slurm" > "jacobi.aaacs" 2> "stderr.aaacs"
fi

# launch job for aaact
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaact.slurm"
else
    sh "./sbatch.aaact.slurm" > "jacobi.aaact" 2> "stderr.aaact"
fi

# launch job for aaacu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacu.slurm"
else
    sh "./sbatch.aaacu.slurm" > "jacobi.aaacu" 2> "stderr.aaacu"
fi

# launch job for aaacv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacv.slurm"
else
    sh "./sbatch.aaacv.slurm" > "jacobi.aaacv" 2> "stderr.aaacv"
fi

# launch job for aaacw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacw.slurm"
else
    sh "./sbatch.aaacw.slurm" > "jacobi.aaacw" 2> "stderr.aaacw"
fi

# launch job for aaacx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacx.slurm"
else
    sh "./sbatch.aaacx.slurm" > "jacobi.aaacx" 2> "stderr.aaacx"
fi

# launch job for aaacy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacy.slurm"
else
    sh "./sbatch.aaacy.slurm" > "jacobi.aaacy" 2> "stderr.aaacy"
fi

# launch job for aaacz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaacz.slurm"
else
    sh "./sbatch.aaacz.slurm" > "jacobi.aaacz" 2> "stderr.aaacz"
fi

# launch job for aaada
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaada.slurm"
else
    sh "./sbatch.aaada.slurm" > "jacobi.aaada" 2> "stderr.aaada"
fi

# launch job for aaadb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadb.slurm"
else
    sh "./sbatch.aaadb.slurm" > "jacobi.aaadb" 2> "stderr.aaadb"
fi

# launch job for aaadc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadc.slurm"
else
    sh "./sbatch.aaadc.slurm" > "jacobi.aaadc" 2> "stderr.aaadc"
fi

# launch job for aaadd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadd.slurm"
else
    sh "./sbatch.aaadd.slurm" > "jacobi.aaadd" 2> "stderr.aaadd"
fi

# launch job for aaade
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaade.slurm"
else
    sh "./sbatch.aaade.slurm" > "jacobi.aaade" 2> "stderr.aaade"
fi

# launch job for aaadf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadf.slurm"
else
    sh "./sbatch.aaadf.slurm" > "jacobi.aaadf" 2> "stderr.aaadf"
fi

# launch job for aaadg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadg.slurm"
else
    sh "./sbatch.aaadg.slurm" > "jacobi.aaadg" 2> "stderr.aaadg"
fi

# launch job for aaadh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadh.slurm"
else
    sh "./sbatch.aaadh.slurm" > "jacobi.aaadh" 2> "stderr.aaadh"
fi

# launch job for aaadi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadi.slurm"
else
    sh "./sbatch.aaadi.slurm" > "jacobi.aaadi" 2> "stderr.aaadi"
fi

# launch job for aaadj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadj.slurm"
else
    sh "./sbatch.aaadj.slurm" > "jacobi.aaadj" 2> "stderr.aaadj"
fi

# launch job for aaadk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadk.slurm"
else
    sh "./sbatch.aaadk.slurm" > "jacobi.aaadk" 2> "stderr.aaadk"
fi

# launch job for aaadl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadl.slurm"
else
    sh "./sbatch.aaadl.slurm" > "jacobi.aaadl" 2> "stderr.aaadl"
fi

# launch job for aaadm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadm.slurm"
else
    sh "./sbatch.aaadm.slurm" > "jacobi.aaadm" 2> "stderr.aaadm"
fi

# launch job for aaadn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadn.slurm"
else
    sh "./sbatch.aaadn.slurm" > "jacobi.aaadn" 2> "stderr.aaadn"
fi

# launch job for aaado
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaado.slurm"
else
    sh "./sbatch.aaado.slurm" > "jacobi.aaado" 2> "stderr.aaado"
fi

# launch job for aaadp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadp.slurm"
else
    sh "./sbatch.aaadp.slurm" > "jacobi.aaadp" 2> "stderr.aaadp"
fi

# launch job for aaadq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadq.slurm"
else
    sh "./sbatch.aaadq.slurm" > "jacobi.aaadq" 2> "stderr.aaadq"
fi

# launch job for aaadr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadr.slurm"
else
    sh "./sbatch.aaadr.slurm" > "jacobi.aaadr" 2> "stderr.aaadr"
fi

# launch job for aaads
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaads.slurm"
else
    sh "./sbatch.aaads.slurm" > "jacobi.aaads" 2> "stderr.aaads"
fi

# launch job for aaadt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadt.slurm"
else
    sh "./sbatch.aaadt.slurm" > "jacobi.aaadt" 2> "stderr.aaadt"
fi

# launch job for aaadu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadu.slurm"
else
    sh "./sbatch.aaadu.slurm" > "jacobi.aaadu" 2> "stderr.aaadu"
fi

# launch job for aaadv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadv.slurm"
else
    sh "./sbatch.aaadv.slurm" > "jacobi.aaadv" 2> "stderr.aaadv"
fi

# launch job for aaadw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadw.slurm"
else
    sh "./sbatch.aaadw.slurm" > "jacobi.aaadw" 2> "stderr.aaadw"
fi

# launch job for aaadx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadx.slurm"
else
    sh "./sbatch.aaadx.slurm" > "jacobi.aaadx" 2> "stderr.aaadx"
fi

# launch job for aaady
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaady.slurm"
else
    sh "./sbatch.aaady.slurm" > "jacobi.aaady" 2> "stderr.aaady"
fi

# launch job for aaadz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaadz.slurm"
else
    sh "./sbatch.aaadz.slurm" > "jacobi.aaadz" 2> "stderr.aaadz"
fi

# launch job for aaaea
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaea.slurm"
else
    sh "./sbatch.aaaea.slurm" > "jacobi.aaaea" 2> "stderr.aaaea"
fi

# launch job for aaaeb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaeb.slurm"
else
    sh "./sbatch.aaaeb.slurm" > "jacobi.aaaeb" 2> "stderr.aaaeb"
fi

# launch job for aaaec
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaec.slurm"
else
    sh "./sbatch.aaaec.slurm" > "jacobi.aaaec" 2> "stderr.aaaec"
fi

# launch job for aaaed
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaed.slurm"
else
    sh "./sbatch.aaaed.slurm" > "jacobi.aaaed" 2> "stderr.aaaed"
fi

# launch job for aaaee
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaee.slurm"
else
    sh "./sbatch.aaaee.slurm" > "jacobi.aaaee" 2> "stderr.aaaee"
fi

# launch job for aaaef
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaef.slurm"
else
    sh "./sbatch.aaaef.slurm" > "jacobi.aaaef" 2> "stderr.aaaef"
fi

# launch job for aaaeg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaeg.slurm"
else
    sh "./sbatch.aaaeg.slurm" > "jacobi.aaaeg" 2> "stderr.aaaeg"
fi

# launch job for aaaeh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaeh.slurm"
else
    sh "./sbatch.aaaeh.slurm" > "jacobi.aaaeh" 2> "stderr.aaaeh"
fi

# launch job for aaaei
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaei.slurm"
else
    sh "./sbatch.aaaei.slurm" > "jacobi.aaaei" 2> "stderr.aaaei"
fi

# launch job for aaaej
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaej.slurm"
else
    sh "./sbatch.aaaej.slurm" > "jacobi.aaaej" 2> "stderr.aaaej"
fi

# launch job for aaaek
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaek.slurm"
else
    sh "./sbatch.aaaek.slurm" > "jacobi.aaaek" 2> "stderr.aaaek"
fi

# launch job for aaael
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaael.slurm"
else
    sh "./sbatch.aaael.slurm" > "jacobi.aaael" 2> "stderr.aaael"
fi

# launch job for aaaem
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaem.slurm"
else
    sh "./sbatch.aaaem.slurm" > "jacobi.aaaem" 2> "stderr.aaaem"
fi

# launch job for aaaen
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaen.slurm"
else
    sh "./sbatch.aaaen.slurm" > "jacobi.aaaen" 2> "stderr.aaaen"
fi

# launch job for aaaeo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaeo.slurm"
else
    sh "./sbatch.aaaeo.slurm" > "jacobi.aaaeo" 2> "stderr.aaaeo"
fi

# launch job for aaaep
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaep.slurm"
else
    sh "./sbatch.aaaep.slurm" > "jacobi.aaaep" 2> "stderr.aaaep"
fi

# launch job for aaaeq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaeq.slurm"
else
    sh "./sbatch.aaaeq.slurm" > "jacobi.aaaeq" 2> "stderr.aaaeq"
fi

# launch job for aaaer
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaer.slurm"
else
    sh "./sbatch.aaaer.slurm" > "jacobi.aaaer" 2> "stderr.aaaer"
fi

# launch job for aaaes
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaes.slurm"
else
    sh "./sbatch.aaaes.slurm" > "jacobi.aaaes" 2> "stderr.aaaes"
fi

# launch job for aaaet
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaet.slurm"
else
    sh "./sbatch.aaaet.slurm" > "jacobi.aaaet" 2> "stderr.aaaet"
fi

# launch job for aaaeu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaeu.slurm"
else
    sh "./sbatch.aaaeu.slurm" > "jacobi.aaaeu" 2> "stderr.aaaeu"
fi

# launch job for aaaev
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaev.slurm"
else
    sh "./sbatch.aaaev.slurm" > "jacobi.aaaev" 2> "stderr.aaaev"
fi

# launch job for aaaew
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaew.slurm"
else
    sh "./sbatch.aaaew.slurm" > "jacobi.aaaew" 2> "stderr.aaaew"
fi

# launch job for aaaex
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaex.slurm"
else
    sh "./sbatch.aaaex.slurm" > "jacobi.aaaex" 2> "stderr.aaaex"
fi

# launch job for aaaey
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaey.slurm"
else
    sh "./sbatch.aaaey.slurm" > "jacobi.aaaey" 2> "stderr.aaaey"
fi

# launch job for aaaez
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaez.slurm"
else
    sh "./sbatch.aaaez.slurm" > "jacobi.aaaez" 2> "stderr.aaaez"
fi

# launch job for aaafa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafa.slurm"
else
    sh "./sbatch.aaafa.slurm" > "jacobi.aaafa" 2> "stderr.aaafa"
fi

# launch job for aaafb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafb.slurm"
else
    sh "./sbatch.aaafb.slurm" > "jacobi.aaafb" 2> "stderr.aaafb"
fi

# launch job for aaafc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafc.slurm"
else
    sh "./sbatch.aaafc.slurm" > "jacobi.aaafc" 2> "stderr.aaafc"
fi

# launch job for aaafd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafd.slurm"
else
    sh "./sbatch.aaafd.slurm" > "jacobi.aaafd" 2> "stderr.aaafd"
fi

# launch job for aaafe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafe.slurm"
else
    sh "./sbatch.aaafe.slurm" > "jacobi.aaafe" 2> "stderr.aaafe"
fi

# launch job for aaaff
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaff.slurm"
else
    sh "./sbatch.aaaff.slurm" > "jacobi.aaaff" 2> "stderr.aaaff"
fi

# launch job for aaafg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafg.slurm"
else
    sh "./sbatch.aaafg.slurm" > "jacobi.aaafg" 2> "stderr.aaafg"
fi

# launch job for aaafh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafh.slurm"
else
    sh "./sbatch.aaafh.slurm" > "jacobi.aaafh" 2> "stderr.aaafh"
fi

# launch job for aaafi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafi.slurm"
else
    sh "./sbatch.aaafi.slurm" > "jacobi.aaafi" 2> "stderr.aaafi"
fi

# launch job for aaafj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafj.slurm"
else
    sh "./sbatch.aaafj.slurm" > "jacobi.aaafj" 2> "stderr.aaafj"
fi

# launch job for aaafk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafk.slurm"
else
    sh "./sbatch.aaafk.slurm" > "jacobi.aaafk" 2> "stderr.aaafk"
fi

# launch job for aaafl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafl.slurm"
else
    sh "./sbatch.aaafl.slurm" > "jacobi.aaafl" 2> "stderr.aaafl"
fi

# launch job for aaafm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafm.slurm"
else
    sh "./sbatch.aaafm.slurm" > "jacobi.aaafm" 2> "stderr.aaafm"
fi

# launch job for aaafn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafn.slurm"
else
    sh "./sbatch.aaafn.slurm" > "jacobi.aaafn" 2> "stderr.aaafn"
fi

# launch job for aaafo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafo.slurm"
else
    sh "./sbatch.aaafo.slurm" > "jacobi.aaafo" 2> "stderr.aaafo"
fi

# launch job for aaafp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafp.slurm"
else
    sh "./sbatch.aaafp.slurm" > "jacobi.aaafp" 2> "stderr.aaafp"
fi

# launch job for aaafq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafq.slurm"
else
    sh "./sbatch.aaafq.slurm" > "jacobi.aaafq" 2> "stderr.aaafq"
fi

# launch job for aaafr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafr.slurm"
else
    sh "./sbatch.aaafr.slurm" > "jacobi.aaafr" 2> "stderr.aaafr"
fi

# launch job for aaafs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafs.slurm"
else
    sh "./sbatch.aaafs.slurm" > "jacobi.aaafs" 2> "stderr.aaafs"
fi

# launch job for aaaft
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaft.slurm"
else
    sh "./sbatch.aaaft.slurm" > "jacobi.aaaft" 2> "stderr.aaaft"
fi

# launch job for aaafu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafu.slurm"
else
    sh "./sbatch.aaafu.slurm" > "jacobi.aaafu" 2> "stderr.aaafu"
fi

# launch job for aaafv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafv.slurm"
else
    sh "./sbatch.aaafv.slurm" > "jacobi.aaafv" 2> "stderr.aaafv"
fi

# launch job for aaafw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafw.slurm"
else
    sh "./sbatch.aaafw.slurm" > "jacobi.aaafw" 2> "stderr.aaafw"
fi

# launch job for aaafx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafx.slurm"
else
    sh "./sbatch.aaafx.slurm" > "jacobi.aaafx" 2> "stderr.aaafx"
fi

# launch job for aaafy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafy.slurm"
else
    sh "./sbatch.aaafy.slurm" > "jacobi.aaafy" 2> "stderr.aaafy"
fi

# launch job for aaafz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaafz.slurm"
else
    sh "./sbatch.aaafz.slurm" > "jacobi.aaafz" 2> "stderr.aaafz"
fi

# launch job for aaaga
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaga.slurm"
else
    sh "./sbatch.aaaga.slurm" > "jacobi.aaaga" 2> "stderr.aaaga"
fi

# launch job for aaagb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagb.slurm"
else
    sh "./sbatch.aaagb.slurm" > "jacobi.aaagb" 2> "stderr.aaagb"
fi

# launch job for aaagc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagc.slurm"
else
    sh "./sbatch.aaagc.slurm" > "jacobi.aaagc" 2> "stderr.aaagc"
fi

# launch job for aaagd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagd.slurm"
else
    sh "./sbatch.aaagd.slurm" > "jacobi.aaagd" 2> "stderr.aaagd"
fi

# launch job for aaage
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaage.slurm"
else
    sh "./sbatch.aaage.slurm" > "jacobi.aaage" 2> "stderr.aaage"
fi

# launch job for aaagf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagf.slurm"
else
    sh "./sbatch.aaagf.slurm" > "jacobi.aaagf" 2> "stderr.aaagf"
fi

# launch job for aaagg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagg.slurm"
else
    sh "./sbatch.aaagg.slurm" > "jacobi.aaagg" 2> "stderr.aaagg"
fi

# launch job for aaagh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagh.slurm"
else
    sh "./sbatch.aaagh.slurm" > "jacobi.aaagh" 2> "stderr.aaagh"
fi

# launch job for aaagi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagi.slurm"
else
    sh "./sbatch.aaagi.slurm" > "jacobi.aaagi" 2> "stderr.aaagi"
fi

# launch job for aaagj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagj.slurm"
else
    sh "./sbatch.aaagj.slurm" > "jacobi.aaagj" 2> "stderr.aaagj"
fi

# launch job for aaagk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagk.slurm"
else
    sh "./sbatch.aaagk.slurm" > "jacobi.aaagk" 2> "stderr.aaagk"
fi

# launch job for aaagl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagl.slurm"
else
    sh "./sbatch.aaagl.slurm" > "jacobi.aaagl" 2> "stderr.aaagl"
fi

# launch job for aaagm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagm.slurm"
else
    sh "./sbatch.aaagm.slurm" > "jacobi.aaagm" 2> "stderr.aaagm"
fi

# launch job for aaagn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagn.slurm"
else
    sh "./sbatch.aaagn.slurm" > "jacobi.aaagn" 2> "stderr.aaagn"
fi

# launch job for aaago
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaago.slurm"
else
    sh "./sbatch.aaago.slurm" > "jacobi.aaago" 2> "stderr.aaago"
fi

# launch job for aaagp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagp.slurm"
else
    sh "./sbatch.aaagp.slurm" > "jacobi.aaagp" 2> "stderr.aaagp"
fi

# launch job for aaagq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagq.slurm"
else
    sh "./sbatch.aaagq.slurm" > "jacobi.aaagq" 2> "stderr.aaagq"
fi

# launch job for aaagr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagr.slurm"
else
    sh "./sbatch.aaagr.slurm" > "jacobi.aaagr" 2> "stderr.aaagr"
fi

# launch job for aaags
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaags.slurm"
else
    sh "./sbatch.aaags.slurm" > "jacobi.aaags" 2> "stderr.aaags"
fi

# launch job for aaagt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagt.slurm"
else
    sh "./sbatch.aaagt.slurm" > "jacobi.aaagt" 2> "stderr.aaagt"
fi

# launch job for aaagu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagu.slurm"
else
    sh "./sbatch.aaagu.slurm" > "jacobi.aaagu" 2> "stderr.aaagu"
fi

# launch job for aaagv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagv.slurm"
else
    sh "./sbatch.aaagv.slurm" > "jacobi.aaagv" 2> "stderr.aaagv"
fi

# launch job for aaagw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagw.slurm"
else
    sh "./sbatch.aaagw.slurm" > "jacobi.aaagw" 2> "stderr.aaagw"
fi

# launch job for aaagx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagx.slurm"
else
    sh "./sbatch.aaagx.slurm" > "jacobi.aaagx" 2> "stderr.aaagx"
fi

# launch job for aaagy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagy.slurm"
else
    sh "./sbatch.aaagy.slurm" > "jacobi.aaagy" 2> "stderr.aaagy"
fi

# launch job for aaagz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaagz.slurm"
else
    sh "./sbatch.aaagz.slurm" > "jacobi.aaagz" 2> "stderr.aaagz"
fi

# launch job for aaaha
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaha.slurm"
else
    sh "./sbatch.aaaha.slurm" > "jacobi.aaaha" 2> "stderr.aaaha"
fi

# launch job for aaahb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahb.slurm"
else
    sh "./sbatch.aaahb.slurm" > "jacobi.aaahb" 2> "stderr.aaahb"
fi

# launch job for aaahc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahc.slurm"
else
    sh "./sbatch.aaahc.slurm" > "jacobi.aaahc" 2> "stderr.aaahc"
fi

# launch job for aaahd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahd.slurm"
else
    sh "./sbatch.aaahd.slurm" > "jacobi.aaahd" 2> "stderr.aaahd"
fi

# launch job for aaahe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahe.slurm"
else
    sh "./sbatch.aaahe.slurm" > "jacobi.aaahe" 2> "stderr.aaahe"
fi

# launch job for aaahf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahf.slurm"
else
    sh "./sbatch.aaahf.slurm" > "jacobi.aaahf" 2> "stderr.aaahf"
fi

# launch job for aaahg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahg.slurm"
else
    sh "./sbatch.aaahg.slurm" > "jacobi.aaahg" 2> "stderr.aaahg"
fi

# launch job for aaahh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahh.slurm"
else
    sh "./sbatch.aaahh.slurm" > "jacobi.aaahh" 2> "stderr.aaahh"
fi

# launch job for aaahi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahi.slurm"
else
    sh "./sbatch.aaahi.slurm" > "jacobi.aaahi" 2> "stderr.aaahi"
fi

# launch job for aaahj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahj.slurm"
else
    sh "./sbatch.aaahj.slurm" > "jacobi.aaahj" 2> "stderr.aaahj"
fi

# launch job for aaahk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahk.slurm"
else
    sh "./sbatch.aaahk.slurm" > "jacobi.aaahk" 2> "stderr.aaahk"
fi

# launch job for aaahl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahl.slurm"
else
    sh "./sbatch.aaahl.slurm" > "jacobi.aaahl" 2> "stderr.aaahl"
fi

# launch job for aaahm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahm.slurm"
else
    sh "./sbatch.aaahm.slurm" > "jacobi.aaahm" 2> "stderr.aaahm"
fi

# launch job for aaahn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahn.slurm"
else
    sh "./sbatch.aaahn.slurm" > "jacobi.aaahn" 2> "stderr.aaahn"
fi

# launch job for aaaho
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaho.slurm"
else
    sh "./sbatch.aaaho.slurm" > "jacobi.aaaho" 2> "stderr.aaaho"
fi

# launch job for aaahp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahp.slurm"
else
    sh "./sbatch.aaahp.slurm" > "jacobi.aaahp" 2> "stderr.aaahp"
fi

# launch job for aaahq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahq.slurm"
else
    sh "./sbatch.aaahq.slurm" > "jacobi.aaahq" 2> "stderr.aaahq"
fi

# launch job for aaahr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahr.slurm"
else
    sh "./sbatch.aaahr.slurm" > "jacobi.aaahr" 2> "stderr.aaahr"
fi

# launch job for aaahs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahs.slurm"
else
    sh "./sbatch.aaahs.slurm" > "jacobi.aaahs" 2> "stderr.aaahs"
fi

# launch job for aaaht
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaht.slurm"
else
    sh "./sbatch.aaaht.slurm" > "jacobi.aaaht" 2> "stderr.aaaht"
fi

# launch job for aaahu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahu.slurm"
else
    sh "./sbatch.aaahu.slurm" > "jacobi.aaahu" 2> "stderr.aaahu"
fi

# launch job for aaahv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahv.slurm"
else
    sh "./sbatch.aaahv.slurm" > "jacobi.aaahv" 2> "stderr.aaahv"
fi

# launch job for aaahw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahw.slurm"
else
    sh "./sbatch.aaahw.slurm" > "jacobi.aaahw" 2> "stderr.aaahw"
fi

# launch job for aaahx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahx.slurm"
else
    sh "./sbatch.aaahx.slurm" > "jacobi.aaahx" 2> "stderr.aaahx"
fi

# launch job for aaahy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahy.slurm"
else
    sh "./sbatch.aaahy.slurm" > "jacobi.aaahy" 2> "stderr.aaahy"
fi

# launch job for aaahz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaahz.slurm"
else
    sh "./sbatch.aaahz.slurm" > "jacobi.aaahz" 2> "stderr.aaahz"
fi

# launch job for aaaia
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaia.slurm"
else
    sh "./sbatch.aaaia.slurm" > "jacobi.aaaia" 2> "stderr.aaaia"
fi

# launch job for aaaib
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaib.slurm"
else
    sh "./sbatch.aaaib.slurm" > "jacobi.aaaib" 2> "stderr.aaaib"
fi

# launch job for aaaic
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaic.slurm"
else
    sh "./sbatch.aaaic.slurm" > "jacobi.aaaic" 2> "stderr.aaaic"
fi

# launch job for aaaid
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaid.slurm"
else
    sh "./sbatch.aaaid.slurm" > "jacobi.aaaid" 2> "stderr.aaaid"
fi

# launch job for aaaie
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaie.slurm"
else
    sh "./sbatch.aaaie.slurm" > "jacobi.aaaie" 2> "stderr.aaaie"
fi

# launch job for aaaif
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaif.slurm"
else
    sh "./sbatch.aaaif.slurm" > "jacobi.aaaif" 2> "stderr.aaaif"
fi

# launch job for aaaig
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaig.slurm"
else
    sh "./sbatch.aaaig.slurm" > "jacobi.aaaig" 2> "stderr.aaaig"
fi

# launch job for aaaih
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaih.slurm"
else
    sh "./sbatch.aaaih.slurm" > "jacobi.aaaih" 2> "stderr.aaaih"
fi

# launch job for aaaii
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaii.slurm"
else
    sh "./sbatch.aaaii.slurm" > "jacobi.aaaii" 2> "stderr.aaaii"
fi

# launch job for aaaij
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaij.slurm"
else
    sh "./sbatch.aaaij.slurm" > "jacobi.aaaij" 2> "stderr.aaaij"
fi

# launch job for aaaik
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaik.slurm"
else
    sh "./sbatch.aaaik.slurm" > "jacobi.aaaik" 2> "stderr.aaaik"
fi

# launch job for aaail
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaail.slurm"
else
    sh "./sbatch.aaail.slurm" > "jacobi.aaail" 2> "stderr.aaail"
fi

# launch job for aaaim
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaim.slurm"
else
    sh "./sbatch.aaaim.slurm" > "jacobi.aaaim" 2> "stderr.aaaim"
fi

# launch job for aaain
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaain.slurm"
else
    sh "./sbatch.aaain.slurm" > "jacobi.aaain" 2> "stderr.aaain"
fi

# launch job for aaaio
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaio.slurm"
else
    sh "./sbatch.aaaio.slurm" > "jacobi.aaaio" 2> "stderr.aaaio"
fi

# launch job for aaaip
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaip.slurm"
else
    sh "./sbatch.aaaip.slurm" > "jacobi.aaaip" 2> "stderr.aaaip"
fi

# launch job for aaaiq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaiq.slurm"
else
    sh "./sbatch.aaaiq.slurm" > "jacobi.aaaiq" 2> "stderr.aaaiq"
fi

# launch job for aaair
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaair.slurm"
else
    sh "./sbatch.aaair.slurm" > "jacobi.aaair" 2> "stderr.aaair"
fi

# launch job for aaais
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaais.slurm"
else
    sh "./sbatch.aaais.slurm" > "jacobi.aaais" 2> "stderr.aaais"
fi

# launch job for aaait
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaait.slurm"
else
    sh "./sbatch.aaait.slurm" > "jacobi.aaait" 2> "stderr.aaait"
fi

# launch job for aaaiu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaiu.slurm"
else
    sh "./sbatch.aaaiu.slurm" > "jacobi.aaaiu" 2> "stderr.aaaiu"
fi

# launch job for aaaiv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaiv.slurm"
else
    sh "./sbatch.aaaiv.slurm" > "jacobi.aaaiv" 2> "stderr.aaaiv"
fi

# launch job for aaaiw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaiw.slurm"
else
    sh "./sbatch.aaaiw.slurm" > "jacobi.aaaiw" 2> "stderr.aaaiw"
fi

# launch job for aaaix
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaix.slurm"
else
    sh "./sbatch.aaaix.slurm" > "jacobi.aaaix" 2> "stderr.aaaix"
fi

# launch job for aaaiy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaiy.slurm"
else
    sh "./sbatch.aaaiy.slurm" > "jacobi.aaaiy" 2> "stderr.aaaiy"
fi

# launch job for aaaiz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaiz.slurm"
else
    sh "./sbatch.aaaiz.slurm" > "jacobi.aaaiz" 2> "stderr.aaaiz"
fi

# launch job for aaaja
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaja.slurm"
else
    sh "./sbatch.aaaja.slurm" > "jacobi.aaaja" 2> "stderr.aaaja"
fi

# launch job for aaajb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajb.slurm"
else
    sh "./sbatch.aaajb.slurm" > "jacobi.aaajb" 2> "stderr.aaajb"
fi

# launch job for aaajc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajc.slurm"
else
    sh "./sbatch.aaajc.slurm" > "jacobi.aaajc" 2> "stderr.aaajc"
fi

# launch job for aaajd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajd.slurm"
else
    sh "./sbatch.aaajd.slurm" > "jacobi.aaajd" 2> "stderr.aaajd"
fi

# launch job for aaaje
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaje.slurm"
else
    sh "./sbatch.aaaje.slurm" > "jacobi.aaaje" 2> "stderr.aaaje"
fi

# launch job for aaajf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajf.slurm"
else
    sh "./sbatch.aaajf.slurm" > "jacobi.aaajf" 2> "stderr.aaajf"
fi

# launch job for aaajg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajg.slurm"
else
    sh "./sbatch.aaajg.slurm" > "jacobi.aaajg" 2> "stderr.aaajg"
fi

# launch job for aaajh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajh.slurm"
else
    sh "./sbatch.aaajh.slurm" > "jacobi.aaajh" 2> "stderr.aaajh"
fi

# launch job for aaaji
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaji.slurm"
else
    sh "./sbatch.aaaji.slurm" > "jacobi.aaaji" 2> "stderr.aaaji"
fi

# launch job for aaajj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajj.slurm"
else
    sh "./sbatch.aaajj.slurm" > "jacobi.aaajj" 2> "stderr.aaajj"
fi

# launch job for aaajk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajk.slurm"
else
    sh "./sbatch.aaajk.slurm" > "jacobi.aaajk" 2> "stderr.aaajk"
fi

# launch job for aaajl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajl.slurm"
else
    sh "./sbatch.aaajl.slurm" > "jacobi.aaajl" 2> "stderr.aaajl"
fi

# launch job for aaajm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajm.slurm"
else
    sh "./sbatch.aaajm.slurm" > "jacobi.aaajm" 2> "stderr.aaajm"
fi

# launch job for aaajn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajn.slurm"
else
    sh "./sbatch.aaajn.slurm" > "jacobi.aaajn" 2> "stderr.aaajn"
fi

# launch job for aaajo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajo.slurm"
else
    sh "./sbatch.aaajo.slurm" > "jacobi.aaajo" 2> "stderr.aaajo"
fi

# launch job for aaajp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajp.slurm"
else
    sh "./sbatch.aaajp.slurm" > "jacobi.aaajp" 2> "stderr.aaajp"
fi

# launch job for aaajq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajq.slurm"
else
    sh "./sbatch.aaajq.slurm" > "jacobi.aaajq" 2> "stderr.aaajq"
fi

# launch job for aaajr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajr.slurm"
else
    sh "./sbatch.aaajr.slurm" > "jacobi.aaajr" 2> "stderr.aaajr"
fi

# launch job for aaajs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajs.slurm"
else
    sh "./sbatch.aaajs.slurm" > "jacobi.aaajs" 2> "stderr.aaajs"
fi

# launch job for aaajt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajt.slurm"
else
    sh "./sbatch.aaajt.slurm" > "jacobi.aaajt" 2> "stderr.aaajt"
fi

# launch job for aaaju
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaju.slurm"
else
    sh "./sbatch.aaaju.slurm" > "jacobi.aaaju" 2> "stderr.aaaju"
fi

# launch job for aaajv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajv.slurm"
else
    sh "./sbatch.aaajv.slurm" > "jacobi.aaajv" 2> "stderr.aaajv"
fi

# launch job for aaajw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajw.slurm"
else
    sh "./sbatch.aaajw.slurm" > "jacobi.aaajw" 2> "stderr.aaajw"
fi

# launch job for aaajx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajx.slurm"
else
    sh "./sbatch.aaajx.slurm" > "jacobi.aaajx" 2> "stderr.aaajx"
fi

# launch job for aaajy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajy.slurm"
else
    sh "./sbatch.aaajy.slurm" > "jacobi.aaajy" 2> "stderr.aaajy"
fi

# launch job for aaajz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaajz.slurm"
else
    sh "./sbatch.aaajz.slurm" > "jacobi.aaajz" 2> "stderr.aaajz"
fi

# launch job for aaaka
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaka.slurm"
else
    sh "./sbatch.aaaka.slurm" > "jacobi.aaaka" 2> "stderr.aaaka"
fi

# launch job for aaakb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakb.slurm"
else
    sh "./sbatch.aaakb.slurm" > "jacobi.aaakb" 2> "stderr.aaakb"
fi

# launch job for aaakc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakc.slurm"
else
    sh "./sbatch.aaakc.slurm" > "jacobi.aaakc" 2> "stderr.aaakc"
fi

# launch job for aaakd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakd.slurm"
else
    sh "./sbatch.aaakd.slurm" > "jacobi.aaakd" 2> "stderr.aaakd"
fi

# launch job for aaake
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaake.slurm"
else
    sh "./sbatch.aaake.slurm" > "jacobi.aaake" 2> "stderr.aaake"
fi

# launch job for aaakf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakf.slurm"
else
    sh "./sbatch.aaakf.slurm" > "jacobi.aaakf" 2> "stderr.aaakf"
fi

# launch job for aaakg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakg.slurm"
else
    sh "./sbatch.aaakg.slurm" > "jacobi.aaakg" 2> "stderr.aaakg"
fi

# launch job for aaakh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakh.slurm"
else
    sh "./sbatch.aaakh.slurm" > "jacobi.aaakh" 2> "stderr.aaakh"
fi

# launch job for aaaki
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaki.slurm"
else
    sh "./sbatch.aaaki.slurm" > "jacobi.aaaki" 2> "stderr.aaaki"
fi

# launch job for aaakj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakj.slurm"
else
    sh "./sbatch.aaakj.slurm" > "jacobi.aaakj" 2> "stderr.aaakj"
fi

# launch job for aaakk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakk.slurm"
else
    sh "./sbatch.aaakk.slurm" > "jacobi.aaakk" 2> "stderr.aaakk"
fi

# launch job for aaakl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakl.slurm"
else
    sh "./sbatch.aaakl.slurm" > "jacobi.aaakl" 2> "stderr.aaakl"
fi

# launch job for aaakm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakm.slurm"
else
    sh "./sbatch.aaakm.slurm" > "jacobi.aaakm" 2> "stderr.aaakm"
fi

# launch job for aaakn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakn.slurm"
else
    sh "./sbatch.aaakn.slurm" > "jacobi.aaakn" 2> "stderr.aaakn"
fi

# launch job for aaako
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaako.slurm"
else
    sh "./sbatch.aaako.slurm" > "jacobi.aaako" 2> "stderr.aaako"
fi

# launch job for aaakp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakp.slurm"
else
    sh "./sbatch.aaakp.slurm" > "jacobi.aaakp" 2> "stderr.aaakp"
fi

# launch job for aaakq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakq.slurm"
else
    sh "./sbatch.aaakq.slurm" > "jacobi.aaakq" 2> "stderr.aaakq"
fi

# launch job for aaakr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakr.slurm"
else
    sh "./sbatch.aaakr.slurm" > "jacobi.aaakr" 2> "stderr.aaakr"
fi

# launch job for aaaks
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaks.slurm"
else
    sh "./sbatch.aaaks.slurm" > "jacobi.aaaks" 2> "stderr.aaaks"
fi

# launch job for aaakt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakt.slurm"
else
    sh "./sbatch.aaakt.slurm" > "jacobi.aaakt" 2> "stderr.aaakt"
fi

# launch job for aaaku
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaku.slurm"
else
    sh "./sbatch.aaaku.slurm" > "jacobi.aaaku" 2> "stderr.aaaku"
fi

# launch job for aaakv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakv.slurm"
else
    sh "./sbatch.aaakv.slurm" > "jacobi.aaakv" 2> "stderr.aaakv"
fi

# launch job for aaakw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakw.slurm"
else
    sh "./sbatch.aaakw.slurm" > "jacobi.aaakw" 2> "stderr.aaakw"
fi

# launch job for aaakx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakx.slurm"
else
    sh "./sbatch.aaakx.slurm" > "jacobi.aaakx" 2> "stderr.aaakx"
fi

# launch job for aaaky
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaky.slurm"
else
    sh "./sbatch.aaaky.slurm" > "jacobi.aaaky" 2> "stderr.aaaky"
fi

# launch job for aaakz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaakz.slurm"
else
    sh "./sbatch.aaakz.slurm" > "jacobi.aaakz" 2> "stderr.aaakz"
fi

# launch job for aaala
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaala.slurm"
else
    sh "./sbatch.aaala.slurm" > "jacobi.aaala" 2> "stderr.aaala"
fi

# launch job for aaalb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalb.slurm"
else
    sh "./sbatch.aaalb.slurm" > "jacobi.aaalb" 2> "stderr.aaalb"
fi

# launch job for aaalc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalc.slurm"
else
    sh "./sbatch.aaalc.slurm" > "jacobi.aaalc" 2> "stderr.aaalc"
fi

# launch job for aaald
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaald.slurm"
else
    sh "./sbatch.aaald.slurm" > "jacobi.aaald" 2> "stderr.aaald"
fi

# launch job for aaale
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaale.slurm"
else
    sh "./sbatch.aaale.slurm" > "jacobi.aaale" 2> "stderr.aaale"
fi

# launch job for aaalf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalf.slurm"
else
    sh "./sbatch.aaalf.slurm" > "jacobi.aaalf" 2> "stderr.aaalf"
fi

# launch job for aaalg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalg.slurm"
else
    sh "./sbatch.aaalg.slurm" > "jacobi.aaalg" 2> "stderr.aaalg"
fi

# launch job for aaalh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalh.slurm"
else
    sh "./sbatch.aaalh.slurm" > "jacobi.aaalh" 2> "stderr.aaalh"
fi

# launch job for aaali
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaali.slurm"
else
    sh "./sbatch.aaali.slurm" > "jacobi.aaali" 2> "stderr.aaali"
fi

# launch job for aaalj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalj.slurm"
else
    sh "./sbatch.aaalj.slurm" > "jacobi.aaalj" 2> "stderr.aaalj"
fi

# launch job for aaalk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalk.slurm"
else
    sh "./sbatch.aaalk.slurm" > "jacobi.aaalk" 2> "stderr.aaalk"
fi

# launch job for aaall
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaall.slurm"
else
    sh "./sbatch.aaall.slurm" > "jacobi.aaall" 2> "stderr.aaall"
fi

# launch job for aaalm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalm.slurm"
else
    sh "./sbatch.aaalm.slurm" > "jacobi.aaalm" 2> "stderr.aaalm"
fi

# launch job for aaaln
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaln.slurm"
else
    sh "./sbatch.aaaln.slurm" > "jacobi.aaaln" 2> "stderr.aaaln"
fi

# launch job for aaalo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalo.slurm"
else
    sh "./sbatch.aaalo.slurm" > "jacobi.aaalo" 2> "stderr.aaalo"
fi

# launch job for aaalp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalp.slurm"
else
    sh "./sbatch.aaalp.slurm" > "jacobi.aaalp" 2> "stderr.aaalp"
fi

# launch job for aaalq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalq.slurm"
else
    sh "./sbatch.aaalq.slurm" > "jacobi.aaalq" 2> "stderr.aaalq"
fi

# launch job for aaalr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalr.slurm"
else
    sh "./sbatch.aaalr.slurm" > "jacobi.aaalr" 2> "stderr.aaalr"
fi

# launch job for aaals
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaals.slurm"
else
    sh "./sbatch.aaals.slurm" > "jacobi.aaals" 2> "stderr.aaals"
fi

# launch job for aaalt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalt.slurm"
else
    sh "./sbatch.aaalt.slurm" > "jacobi.aaalt" 2> "stderr.aaalt"
fi

# launch job for aaalu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalu.slurm"
else
    sh "./sbatch.aaalu.slurm" > "jacobi.aaalu" 2> "stderr.aaalu"
fi

# launch job for aaalv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalv.slurm"
else
    sh "./sbatch.aaalv.slurm" > "jacobi.aaalv" 2> "stderr.aaalv"
fi

# launch job for aaalw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalw.slurm"
else
    sh "./sbatch.aaalw.slurm" > "jacobi.aaalw" 2> "stderr.aaalw"
fi

# launch job for aaalx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalx.slurm"
else
    sh "./sbatch.aaalx.slurm" > "jacobi.aaalx" 2> "stderr.aaalx"
fi

# launch job for aaaly
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaly.slurm"
else
    sh "./sbatch.aaaly.slurm" > "jacobi.aaaly" 2> "stderr.aaaly"
fi

# launch job for aaalz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaalz.slurm"
else
    sh "./sbatch.aaalz.slurm" > "jacobi.aaalz" 2> "stderr.aaalz"
fi

# launch job for aaama
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaama.slurm"
else
    sh "./sbatch.aaama.slurm" > "jacobi.aaama" 2> "stderr.aaama"
fi

# launch job for aaamb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamb.slurm"
else
    sh "./sbatch.aaamb.slurm" > "jacobi.aaamb" 2> "stderr.aaamb"
fi

# launch job for aaamc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamc.slurm"
else
    sh "./sbatch.aaamc.slurm" > "jacobi.aaamc" 2> "stderr.aaamc"
fi

# launch job for aaamd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamd.slurm"
else
    sh "./sbatch.aaamd.slurm" > "jacobi.aaamd" 2> "stderr.aaamd"
fi

# launch job for aaame
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaame.slurm"
else
    sh "./sbatch.aaame.slurm" > "jacobi.aaame" 2> "stderr.aaame"
fi

# launch job for aaamf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamf.slurm"
else
    sh "./sbatch.aaamf.slurm" > "jacobi.aaamf" 2> "stderr.aaamf"
fi

# launch job for aaamg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamg.slurm"
else
    sh "./sbatch.aaamg.slurm" > "jacobi.aaamg" 2> "stderr.aaamg"
fi

# launch job for aaamh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamh.slurm"
else
    sh "./sbatch.aaamh.slurm" > "jacobi.aaamh" 2> "stderr.aaamh"
fi

# launch job for aaami
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaami.slurm"
else
    sh "./sbatch.aaami.slurm" > "jacobi.aaami" 2> "stderr.aaami"
fi

# launch job for aaamj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamj.slurm"
else
    sh "./sbatch.aaamj.slurm" > "jacobi.aaamj" 2> "stderr.aaamj"
fi

# launch job for aaamk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamk.slurm"
else
    sh "./sbatch.aaamk.slurm" > "jacobi.aaamk" 2> "stderr.aaamk"
fi

# launch job for aaaml
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaml.slurm"
else
    sh "./sbatch.aaaml.slurm" > "jacobi.aaaml" 2> "stderr.aaaml"
fi

# launch job for aaamm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamm.slurm"
else
    sh "./sbatch.aaamm.slurm" > "jacobi.aaamm" 2> "stderr.aaamm"
fi

# launch job for aaamn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamn.slurm"
else
    sh "./sbatch.aaamn.slurm" > "jacobi.aaamn" 2> "stderr.aaamn"
fi

# launch job for aaamo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamo.slurm"
else
    sh "./sbatch.aaamo.slurm" > "jacobi.aaamo" 2> "stderr.aaamo"
fi

# launch job for aaamp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamp.slurm"
else
    sh "./sbatch.aaamp.slurm" > "jacobi.aaamp" 2> "stderr.aaamp"
fi

# launch job for aaamq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamq.slurm"
else
    sh "./sbatch.aaamq.slurm" > "jacobi.aaamq" 2> "stderr.aaamq"
fi

# launch job for aaamr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamr.slurm"
else
    sh "./sbatch.aaamr.slurm" > "jacobi.aaamr" 2> "stderr.aaamr"
fi

# launch job for aaams
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaams.slurm"
else
    sh "./sbatch.aaams.slurm" > "jacobi.aaams" 2> "stderr.aaams"
fi

# launch job for aaamt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamt.slurm"
else
    sh "./sbatch.aaamt.slurm" > "jacobi.aaamt" 2> "stderr.aaamt"
fi

# launch job for aaamu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamu.slurm"
else
    sh "./sbatch.aaamu.slurm" > "jacobi.aaamu" 2> "stderr.aaamu"
fi

# launch job for aaamv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamv.slurm"
else
    sh "./sbatch.aaamv.slurm" > "jacobi.aaamv" 2> "stderr.aaamv"
fi

# launch job for aaamw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamw.slurm"
else
    sh "./sbatch.aaamw.slurm" > "jacobi.aaamw" 2> "stderr.aaamw"
fi

# launch job for aaamx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamx.slurm"
else
    sh "./sbatch.aaamx.slurm" > "jacobi.aaamx" 2> "stderr.aaamx"
fi

# launch job for aaamy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamy.slurm"
else
    sh "./sbatch.aaamy.slurm" > "jacobi.aaamy" 2> "stderr.aaamy"
fi

# launch job for aaamz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaamz.slurm"
else
    sh "./sbatch.aaamz.slurm" > "jacobi.aaamz" 2> "stderr.aaamz"
fi

# launch job for aaana
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaana.slurm"
else
    sh "./sbatch.aaana.slurm" > "jacobi.aaana" 2> "stderr.aaana"
fi

# launch job for aaanb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanb.slurm"
else
    sh "./sbatch.aaanb.slurm" > "jacobi.aaanb" 2> "stderr.aaanb"
fi

# launch job for aaanc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanc.slurm"
else
    sh "./sbatch.aaanc.slurm" > "jacobi.aaanc" 2> "stderr.aaanc"
fi

# launch job for aaand
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaand.slurm"
else
    sh "./sbatch.aaand.slurm" > "jacobi.aaand" 2> "stderr.aaand"
fi

# launch job for aaane
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaane.slurm"
else
    sh "./sbatch.aaane.slurm" > "jacobi.aaane" 2> "stderr.aaane"
fi

# launch job for aaanf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanf.slurm"
else
    sh "./sbatch.aaanf.slurm" > "jacobi.aaanf" 2> "stderr.aaanf"
fi

# launch job for aaang
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaang.slurm"
else
    sh "./sbatch.aaang.slurm" > "jacobi.aaang" 2> "stderr.aaang"
fi

# launch job for aaanh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanh.slurm"
else
    sh "./sbatch.aaanh.slurm" > "jacobi.aaanh" 2> "stderr.aaanh"
fi

# launch job for aaani
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaani.slurm"
else
    sh "./sbatch.aaani.slurm" > "jacobi.aaani" 2> "stderr.aaani"
fi

# launch job for aaanj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanj.slurm"
else
    sh "./sbatch.aaanj.slurm" > "jacobi.aaanj" 2> "stderr.aaanj"
fi

# launch job for aaank
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaank.slurm"
else
    sh "./sbatch.aaank.slurm" > "jacobi.aaank" 2> "stderr.aaank"
fi

# launch job for aaanl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanl.slurm"
else
    sh "./sbatch.aaanl.slurm" > "jacobi.aaanl" 2> "stderr.aaanl"
fi

# launch job for aaanm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanm.slurm"
else
    sh "./sbatch.aaanm.slurm" > "jacobi.aaanm" 2> "stderr.aaanm"
fi

# launch job for aaann
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaann.slurm"
else
    sh "./sbatch.aaann.slurm" > "jacobi.aaann" 2> "stderr.aaann"
fi

# launch job for aaano
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaano.slurm"
else
    sh "./sbatch.aaano.slurm" > "jacobi.aaano" 2> "stderr.aaano"
fi

# launch job for aaanp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanp.slurm"
else
    sh "./sbatch.aaanp.slurm" > "jacobi.aaanp" 2> "stderr.aaanp"
fi

# launch job for aaanq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanq.slurm"
else
    sh "./sbatch.aaanq.slurm" > "jacobi.aaanq" 2> "stderr.aaanq"
fi

# launch job for aaanr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanr.slurm"
else
    sh "./sbatch.aaanr.slurm" > "jacobi.aaanr" 2> "stderr.aaanr"
fi

# launch job for aaans
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaans.slurm"
else
    sh "./sbatch.aaans.slurm" > "jacobi.aaans" 2> "stderr.aaans"
fi

# launch job for aaant
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaant.slurm"
else
    sh "./sbatch.aaant.slurm" > "jacobi.aaant" 2> "stderr.aaant"
fi

# launch job for aaanu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanu.slurm"
else
    sh "./sbatch.aaanu.slurm" > "jacobi.aaanu" 2> "stderr.aaanu"
fi

# launch job for aaanv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanv.slurm"
else
    sh "./sbatch.aaanv.slurm" > "jacobi.aaanv" 2> "stderr.aaanv"
fi

# launch job for aaanw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanw.slurm"
else
    sh "./sbatch.aaanw.slurm" > "jacobi.aaanw" 2> "stderr.aaanw"
fi

# launch job for aaanx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanx.slurm"
else
    sh "./sbatch.aaanx.slurm" > "jacobi.aaanx" 2> "stderr.aaanx"
fi

# launch job for aaany
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaany.slurm"
else
    sh "./sbatch.aaany.slurm" > "jacobi.aaany" 2> "stderr.aaany"
fi

# launch job for aaanz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaanz.slurm"
else
    sh "./sbatch.aaanz.slurm" > "jacobi.aaanz" 2> "stderr.aaanz"
fi

# launch job for aaaoa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoa.slurm"
else
    sh "./sbatch.aaaoa.slurm" > "jacobi.aaaoa" 2> "stderr.aaaoa"
fi

# launch job for aaaob
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaob.slurm"
else
    sh "./sbatch.aaaob.slurm" > "jacobi.aaaob" 2> "stderr.aaaob"
fi

# launch job for aaaoc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoc.slurm"
else
    sh "./sbatch.aaaoc.slurm" > "jacobi.aaaoc" 2> "stderr.aaaoc"
fi

# launch job for aaaod
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaod.slurm"
else
    sh "./sbatch.aaaod.slurm" > "jacobi.aaaod" 2> "stderr.aaaod"
fi

# launch job for aaaoe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoe.slurm"
else
    sh "./sbatch.aaaoe.slurm" > "jacobi.aaaoe" 2> "stderr.aaaoe"
fi

# launch job for aaaof
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaof.slurm"
else
    sh "./sbatch.aaaof.slurm" > "jacobi.aaaof" 2> "stderr.aaaof"
fi

# launch job for aaaog
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaog.slurm"
else
    sh "./sbatch.aaaog.slurm" > "jacobi.aaaog" 2> "stderr.aaaog"
fi

# launch job for aaaoh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoh.slurm"
else
    sh "./sbatch.aaaoh.slurm" > "jacobi.aaaoh" 2> "stderr.aaaoh"
fi

# launch job for aaaoi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoi.slurm"
else
    sh "./sbatch.aaaoi.slurm" > "jacobi.aaaoi" 2> "stderr.aaaoi"
fi

# launch job for aaaoj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoj.slurm"
else
    sh "./sbatch.aaaoj.slurm" > "jacobi.aaaoj" 2> "stderr.aaaoj"
fi

# launch job for aaaok
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaok.slurm"
else
    sh "./sbatch.aaaok.slurm" > "jacobi.aaaok" 2> "stderr.aaaok"
fi

# launch job for aaaol
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaol.slurm"
else
    sh "./sbatch.aaaol.slurm" > "jacobi.aaaol" 2> "stderr.aaaol"
fi

# launch job for aaaom
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaom.slurm"
else
    sh "./sbatch.aaaom.slurm" > "jacobi.aaaom" 2> "stderr.aaaom"
fi

# launch job for aaaon
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaon.slurm"
else
    sh "./sbatch.aaaon.slurm" > "jacobi.aaaon" 2> "stderr.aaaon"
fi

# launch job for aaaoo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoo.slurm"
else
    sh "./sbatch.aaaoo.slurm" > "jacobi.aaaoo" 2> "stderr.aaaoo"
fi

# launch job for aaaop
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaop.slurm"
else
    sh "./sbatch.aaaop.slurm" > "jacobi.aaaop" 2> "stderr.aaaop"
fi

# launch job for aaaoq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoq.slurm"
else
    sh "./sbatch.aaaoq.slurm" > "jacobi.aaaoq" 2> "stderr.aaaoq"
fi

# launch job for aaaor
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaor.slurm"
else
    sh "./sbatch.aaaor.slurm" > "jacobi.aaaor" 2> "stderr.aaaor"
fi

# launch job for aaaos
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaos.slurm"
else
    sh "./sbatch.aaaos.slurm" > "jacobi.aaaos" 2> "stderr.aaaos"
fi

# launch job for aaaot
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaot.slurm"
else
    sh "./sbatch.aaaot.slurm" > "jacobi.aaaot" 2> "stderr.aaaot"
fi

# launch job for aaaou
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaou.slurm"
else
    sh "./sbatch.aaaou.slurm" > "jacobi.aaaou" 2> "stderr.aaaou"
fi

# launch job for aaaov
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaov.slurm"
else
    sh "./sbatch.aaaov.slurm" > "jacobi.aaaov" 2> "stderr.aaaov"
fi

# launch job for aaaow
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaow.slurm"
else
    sh "./sbatch.aaaow.slurm" > "jacobi.aaaow" 2> "stderr.aaaow"
fi

# launch job for aaaox
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaox.slurm"
else
    sh "./sbatch.aaaox.slurm" > "jacobi.aaaox" 2> "stderr.aaaox"
fi

# launch job for aaaoy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoy.slurm"
else
    sh "./sbatch.aaaoy.slurm" > "jacobi.aaaoy" 2> "stderr.aaaoy"
fi

# launch job for aaaoz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaoz.slurm"
else
    sh "./sbatch.aaaoz.slurm" > "jacobi.aaaoz" 2> "stderr.aaaoz"
fi

# launch job for aaapa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapa.slurm"
else
    sh "./sbatch.aaapa.slurm" > "jacobi.aaapa" 2> "stderr.aaapa"
fi

# launch job for aaapb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapb.slurm"
else
    sh "./sbatch.aaapb.slurm" > "jacobi.aaapb" 2> "stderr.aaapb"
fi

# launch job for aaapc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapc.slurm"
else
    sh "./sbatch.aaapc.slurm" > "jacobi.aaapc" 2> "stderr.aaapc"
fi

# launch job for aaapd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapd.slurm"
else
    sh "./sbatch.aaapd.slurm" > "jacobi.aaapd" 2> "stderr.aaapd"
fi

# launch job for aaape
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaape.slurm"
else
    sh "./sbatch.aaape.slurm" > "jacobi.aaape" 2> "stderr.aaape"
fi

# launch job for aaapf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapf.slurm"
else
    sh "./sbatch.aaapf.slurm" > "jacobi.aaapf" 2> "stderr.aaapf"
fi

# launch job for aaapg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapg.slurm"
else
    sh "./sbatch.aaapg.slurm" > "jacobi.aaapg" 2> "stderr.aaapg"
fi

# launch job for aaaph
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaph.slurm"
else
    sh "./sbatch.aaaph.slurm" > "jacobi.aaaph" 2> "stderr.aaaph"
fi

# launch job for aaapi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapi.slurm"
else
    sh "./sbatch.aaapi.slurm" > "jacobi.aaapi" 2> "stderr.aaapi"
fi

# launch job for aaapj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapj.slurm"
else
    sh "./sbatch.aaapj.slurm" > "jacobi.aaapj" 2> "stderr.aaapj"
fi

# launch job for aaapk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapk.slurm"
else
    sh "./sbatch.aaapk.slurm" > "jacobi.aaapk" 2> "stderr.aaapk"
fi

# launch job for aaapl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapl.slurm"
else
    sh "./sbatch.aaapl.slurm" > "jacobi.aaapl" 2> "stderr.aaapl"
fi

# launch job for aaapm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapm.slurm"
else
    sh "./sbatch.aaapm.slurm" > "jacobi.aaapm" 2> "stderr.aaapm"
fi

# launch job for aaapn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapn.slurm"
else
    sh "./sbatch.aaapn.slurm" > "jacobi.aaapn" 2> "stderr.aaapn"
fi

# launch job for aaapo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapo.slurm"
else
    sh "./sbatch.aaapo.slurm" > "jacobi.aaapo" 2> "stderr.aaapo"
fi

# launch job for aaapp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapp.slurm"
else
    sh "./sbatch.aaapp.slurm" > "jacobi.aaapp" 2> "stderr.aaapp"
fi

# launch job for aaapq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapq.slurm"
else
    sh "./sbatch.aaapq.slurm" > "jacobi.aaapq" 2> "stderr.aaapq"
fi

# launch job for aaapr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapr.slurm"
else
    sh "./sbatch.aaapr.slurm" > "jacobi.aaapr" 2> "stderr.aaapr"
fi

# launch job for aaaps
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaps.slurm"
else
    sh "./sbatch.aaaps.slurm" > "jacobi.aaaps" 2> "stderr.aaaps"
fi

# launch job for aaapt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapt.slurm"
else
    sh "./sbatch.aaapt.slurm" > "jacobi.aaapt" 2> "stderr.aaapt"
fi

# launch job for aaapu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapu.slurm"
else
    sh "./sbatch.aaapu.slurm" > "jacobi.aaapu" 2> "stderr.aaapu"
fi

# launch job for aaapv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapv.slurm"
else
    sh "./sbatch.aaapv.slurm" > "jacobi.aaapv" 2> "stderr.aaapv"
fi

# launch job for aaapw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapw.slurm"
else
    sh "./sbatch.aaapw.slurm" > "jacobi.aaapw" 2> "stderr.aaapw"
fi

# launch job for aaapx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapx.slurm"
else
    sh "./sbatch.aaapx.slurm" > "jacobi.aaapx" 2> "stderr.aaapx"
fi

# launch job for aaapy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapy.slurm"
else
    sh "./sbatch.aaapy.slurm" > "jacobi.aaapy" 2> "stderr.aaapy"
fi

# launch job for aaapz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaapz.slurm"
else
    sh "./sbatch.aaapz.slurm" > "jacobi.aaapz" 2> "stderr.aaapz"
fi

# launch job for aaaqa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqa.slurm"
else
    sh "./sbatch.aaaqa.slurm" > "jacobi.aaaqa" 2> "stderr.aaaqa"
fi

# launch job for aaaqb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqb.slurm"
else
    sh "./sbatch.aaaqb.slurm" > "jacobi.aaaqb" 2> "stderr.aaaqb"
fi

# launch job for aaaqc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqc.slurm"
else
    sh "./sbatch.aaaqc.slurm" > "jacobi.aaaqc" 2> "stderr.aaaqc"
fi

# launch job for aaaqd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqd.slurm"
else
    sh "./sbatch.aaaqd.slurm" > "jacobi.aaaqd" 2> "stderr.aaaqd"
fi

# launch job for aaaqe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqe.slurm"
else
    sh "./sbatch.aaaqe.slurm" > "jacobi.aaaqe" 2> "stderr.aaaqe"
fi

# launch job for aaaqf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqf.slurm"
else
    sh "./sbatch.aaaqf.slurm" > "jacobi.aaaqf" 2> "stderr.aaaqf"
fi

# launch job for aaaqg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqg.slurm"
else
    sh "./sbatch.aaaqg.slurm" > "jacobi.aaaqg" 2> "stderr.aaaqg"
fi

# launch job for aaaqh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqh.slurm"
else
    sh "./sbatch.aaaqh.slurm" > "jacobi.aaaqh" 2> "stderr.aaaqh"
fi

# launch job for aaaqi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqi.slurm"
else
    sh "./sbatch.aaaqi.slurm" > "jacobi.aaaqi" 2> "stderr.aaaqi"
fi

# launch job for aaaqj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqj.slurm"
else
    sh "./sbatch.aaaqj.slurm" > "jacobi.aaaqj" 2> "stderr.aaaqj"
fi

# launch job for aaaqk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqk.slurm"
else
    sh "./sbatch.aaaqk.slurm" > "jacobi.aaaqk" 2> "stderr.aaaqk"
fi

# launch job for aaaql
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaql.slurm"
else
    sh "./sbatch.aaaql.slurm" > "jacobi.aaaql" 2> "stderr.aaaql"
fi

# launch job for aaaqm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqm.slurm"
else
    sh "./sbatch.aaaqm.slurm" > "jacobi.aaaqm" 2> "stderr.aaaqm"
fi

# launch job for aaaqn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqn.slurm"
else
    sh "./sbatch.aaaqn.slurm" > "jacobi.aaaqn" 2> "stderr.aaaqn"
fi

# launch job for aaaqo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqo.slurm"
else
    sh "./sbatch.aaaqo.slurm" > "jacobi.aaaqo" 2> "stderr.aaaqo"
fi

# launch job for aaaqp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqp.slurm"
else
    sh "./sbatch.aaaqp.slurm" > "jacobi.aaaqp" 2> "stderr.aaaqp"
fi

# launch job for aaaqq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqq.slurm"
else
    sh "./sbatch.aaaqq.slurm" > "jacobi.aaaqq" 2> "stderr.aaaqq"
fi

# launch job for aaaqr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqr.slurm"
else
    sh "./sbatch.aaaqr.slurm" > "jacobi.aaaqr" 2> "stderr.aaaqr"
fi

# launch job for aaaqs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqs.slurm"
else
    sh "./sbatch.aaaqs.slurm" > "jacobi.aaaqs" 2> "stderr.aaaqs"
fi

# launch job for aaaqt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqt.slurm"
else
    sh "./sbatch.aaaqt.slurm" > "jacobi.aaaqt" 2> "stderr.aaaqt"
fi

# launch job for aaaqu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqu.slurm"
else
    sh "./sbatch.aaaqu.slurm" > "jacobi.aaaqu" 2> "stderr.aaaqu"
fi

# launch job for aaaqv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqv.slurm"
else
    sh "./sbatch.aaaqv.slurm" > "jacobi.aaaqv" 2> "stderr.aaaqv"
fi

# launch job for aaaqw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqw.slurm"
else
    sh "./sbatch.aaaqw.slurm" > "jacobi.aaaqw" 2> "stderr.aaaqw"
fi

# launch job for aaaqx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqx.slurm"
else
    sh "./sbatch.aaaqx.slurm" > "jacobi.aaaqx" 2> "stderr.aaaqx"
fi

# launch job for aaaqy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqy.slurm"
else
    sh "./sbatch.aaaqy.slurm" > "jacobi.aaaqy" 2> "stderr.aaaqy"
fi

# launch job for aaaqz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaqz.slurm"
else
    sh "./sbatch.aaaqz.slurm" > "jacobi.aaaqz" 2> "stderr.aaaqz"
fi

# launch job for aaara
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaara.slurm"
else
    sh "./sbatch.aaara.slurm" > "jacobi.aaara" 2> "stderr.aaara"
fi

# launch job for aaarb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarb.slurm"
else
    sh "./sbatch.aaarb.slurm" > "jacobi.aaarb" 2> "stderr.aaarb"
fi

# launch job for aaarc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarc.slurm"
else
    sh "./sbatch.aaarc.slurm" > "jacobi.aaarc" 2> "stderr.aaarc"
fi

# launch job for aaard
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaard.slurm"
else
    sh "./sbatch.aaard.slurm" > "jacobi.aaard" 2> "stderr.aaard"
fi

# launch job for aaare
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaare.slurm"
else
    sh "./sbatch.aaare.slurm" > "jacobi.aaare" 2> "stderr.aaare"
fi

# launch job for aaarf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarf.slurm"
else
    sh "./sbatch.aaarf.slurm" > "jacobi.aaarf" 2> "stderr.aaarf"
fi

# launch job for aaarg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarg.slurm"
else
    sh "./sbatch.aaarg.slurm" > "jacobi.aaarg" 2> "stderr.aaarg"
fi

# launch job for aaarh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarh.slurm"
else
    sh "./sbatch.aaarh.slurm" > "jacobi.aaarh" 2> "stderr.aaarh"
fi

# launch job for aaari
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaari.slurm"
else
    sh "./sbatch.aaari.slurm" > "jacobi.aaari" 2> "stderr.aaari"
fi

# launch job for aaarj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarj.slurm"
else
    sh "./sbatch.aaarj.slurm" > "jacobi.aaarj" 2> "stderr.aaarj"
fi

# launch job for aaark
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaark.slurm"
else
    sh "./sbatch.aaark.slurm" > "jacobi.aaark" 2> "stderr.aaark"
fi

# launch job for aaarl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarl.slurm"
else
    sh "./sbatch.aaarl.slurm" > "jacobi.aaarl" 2> "stderr.aaarl"
fi

# launch job for aaarm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarm.slurm"
else
    sh "./sbatch.aaarm.slurm" > "jacobi.aaarm" 2> "stderr.aaarm"
fi

# launch job for aaarn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarn.slurm"
else
    sh "./sbatch.aaarn.slurm" > "jacobi.aaarn" 2> "stderr.aaarn"
fi

# launch job for aaaro
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaro.slurm"
else
    sh "./sbatch.aaaro.slurm" > "jacobi.aaaro" 2> "stderr.aaaro"
fi

# launch job for aaarp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarp.slurm"
else
    sh "./sbatch.aaarp.slurm" > "jacobi.aaarp" 2> "stderr.aaarp"
fi

# launch job for aaarq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarq.slurm"
else
    sh "./sbatch.aaarq.slurm" > "jacobi.aaarq" 2> "stderr.aaarq"
fi

# launch job for aaarr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarr.slurm"
else
    sh "./sbatch.aaarr.slurm" > "jacobi.aaarr" 2> "stderr.aaarr"
fi

# launch job for aaars
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaars.slurm"
else
    sh "./sbatch.aaars.slurm" > "jacobi.aaars" 2> "stderr.aaars"
fi

# launch job for aaart
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaart.slurm"
else
    sh "./sbatch.aaart.slurm" > "jacobi.aaart" 2> "stderr.aaart"
fi

# launch job for aaaru
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaru.slurm"
else
    sh "./sbatch.aaaru.slurm" > "jacobi.aaaru" 2> "stderr.aaaru"
fi

# launch job for aaarv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarv.slurm"
else
    sh "./sbatch.aaarv.slurm" > "jacobi.aaarv" 2> "stderr.aaarv"
fi

# launch job for aaarw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarw.slurm"
else
    sh "./sbatch.aaarw.slurm" > "jacobi.aaarw" 2> "stderr.aaarw"
fi

# launch job for aaarx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarx.slurm"
else
    sh "./sbatch.aaarx.slurm" > "jacobi.aaarx" 2> "stderr.aaarx"
fi

# launch job for aaary
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaary.slurm"
else
    sh "./sbatch.aaary.slurm" > "jacobi.aaary" 2> "stderr.aaary"
fi

# launch job for aaarz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaarz.slurm"
else
    sh "./sbatch.aaarz.slurm" > "jacobi.aaarz" 2> "stderr.aaarz"
fi

# launch job for aaasa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasa.slurm"
else
    sh "./sbatch.aaasa.slurm" > "jacobi.aaasa" 2> "stderr.aaasa"
fi

# launch job for aaasb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasb.slurm"
else
    sh "./sbatch.aaasb.slurm" > "jacobi.aaasb" 2> "stderr.aaasb"
fi

# launch job for aaasc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasc.slurm"
else
    sh "./sbatch.aaasc.slurm" > "jacobi.aaasc" 2> "stderr.aaasc"
fi

# launch job for aaasd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasd.slurm"
else
    sh "./sbatch.aaasd.slurm" > "jacobi.aaasd" 2> "stderr.aaasd"
fi

# launch job for aaase
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaase.slurm"
else
    sh "./sbatch.aaase.slurm" > "jacobi.aaase" 2> "stderr.aaase"
fi

# launch job for aaasf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasf.slurm"
else
    sh "./sbatch.aaasf.slurm" > "jacobi.aaasf" 2> "stderr.aaasf"
fi

# launch job for aaasg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasg.slurm"
else
    sh "./sbatch.aaasg.slurm" > "jacobi.aaasg" 2> "stderr.aaasg"
fi

# launch job for aaash
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaash.slurm"
else
    sh "./sbatch.aaash.slurm" > "jacobi.aaash" 2> "stderr.aaash"
fi

# launch job for aaasi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasi.slurm"
else
    sh "./sbatch.aaasi.slurm" > "jacobi.aaasi" 2> "stderr.aaasi"
fi

# launch job for aaasj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasj.slurm"
else
    sh "./sbatch.aaasj.slurm" > "jacobi.aaasj" 2> "stderr.aaasj"
fi

# launch job for aaask
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaask.slurm"
else
    sh "./sbatch.aaask.slurm" > "jacobi.aaask" 2> "stderr.aaask"
fi

# launch job for aaasl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasl.slurm"
else
    sh "./sbatch.aaasl.slurm" > "jacobi.aaasl" 2> "stderr.aaasl"
fi

# launch job for aaasm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasm.slurm"
else
    sh "./sbatch.aaasm.slurm" > "jacobi.aaasm" 2> "stderr.aaasm"
fi

# launch job for aaasn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasn.slurm"
else
    sh "./sbatch.aaasn.slurm" > "jacobi.aaasn" 2> "stderr.aaasn"
fi

# launch job for aaaso
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaso.slurm"
else
    sh "./sbatch.aaaso.slurm" > "jacobi.aaaso" 2> "stderr.aaaso"
fi

# launch job for aaasp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasp.slurm"
else
    sh "./sbatch.aaasp.slurm" > "jacobi.aaasp" 2> "stderr.aaasp"
fi

# launch job for aaasq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasq.slurm"
else
    sh "./sbatch.aaasq.slurm" > "jacobi.aaasq" 2> "stderr.aaasq"
fi

# launch job for aaasr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasr.slurm"
else
    sh "./sbatch.aaasr.slurm" > "jacobi.aaasr" 2> "stderr.aaasr"
fi

# launch job for aaass
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaass.slurm"
else
    sh "./sbatch.aaass.slurm" > "jacobi.aaass" 2> "stderr.aaass"
fi

# launch job for aaast
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaast.slurm"
else
    sh "./sbatch.aaast.slurm" > "jacobi.aaast" 2> "stderr.aaast"
fi

# launch job for aaasu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasu.slurm"
else
    sh "./sbatch.aaasu.slurm" > "jacobi.aaasu" 2> "stderr.aaasu"
fi

# launch job for aaasv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasv.slurm"
else
    sh "./sbatch.aaasv.slurm" > "jacobi.aaasv" 2> "stderr.aaasv"
fi

# launch job for aaasw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasw.slurm"
else
    sh "./sbatch.aaasw.slurm" > "jacobi.aaasw" 2> "stderr.aaasw"
fi

# launch job for aaasx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasx.slurm"
else
    sh "./sbatch.aaasx.slurm" > "jacobi.aaasx" 2> "stderr.aaasx"
fi

# launch job for aaasy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasy.slurm"
else
    sh "./sbatch.aaasy.slurm" > "jacobi.aaasy" 2> "stderr.aaasy"
fi

# launch job for aaasz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaasz.slurm"
else
    sh "./sbatch.aaasz.slurm" > "jacobi.aaasz" 2> "stderr.aaasz"
fi

# launch job for aaata
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaata.slurm"
else
    sh "./sbatch.aaata.slurm" > "jacobi.aaata" 2> "stderr.aaata"
fi

# launch job for aaatb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatb.slurm"
else
    sh "./sbatch.aaatb.slurm" > "jacobi.aaatb" 2> "stderr.aaatb"
fi

# launch job for aaatc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatc.slurm"
else
    sh "./sbatch.aaatc.slurm" > "jacobi.aaatc" 2> "stderr.aaatc"
fi

# launch job for aaatd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatd.slurm"
else
    sh "./sbatch.aaatd.slurm" > "jacobi.aaatd" 2> "stderr.aaatd"
fi

# launch job for aaate
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaate.slurm"
else
    sh "./sbatch.aaate.slurm" > "jacobi.aaate" 2> "stderr.aaate"
fi

# launch job for aaatf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatf.slurm"
else
    sh "./sbatch.aaatf.slurm" > "jacobi.aaatf" 2> "stderr.aaatf"
fi

# launch job for aaatg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatg.slurm"
else
    sh "./sbatch.aaatg.slurm" > "jacobi.aaatg" 2> "stderr.aaatg"
fi

# launch job for aaath
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaath.slurm"
else
    sh "./sbatch.aaath.slurm" > "jacobi.aaath" 2> "stderr.aaath"
fi

# launch job for aaati
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaati.slurm"
else
    sh "./sbatch.aaati.slurm" > "jacobi.aaati" 2> "stderr.aaati"
fi

# launch job for aaatj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatj.slurm"
else
    sh "./sbatch.aaatj.slurm" > "jacobi.aaatj" 2> "stderr.aaatj"
fi

# launch job for aaatk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatk.slurm"
else
    sh "./sbatch.aaatk.slurm" > "jacobi.aaatk" 2> "stderr.aaatk"
fi

# launch job for aaatl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatl.slurm"
else
    sh "./sbatch.aaatl.slurm" > "jacobi.aaatl" 2> "stderr.aaatl"
fi

# launch job for aaatm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatm.slurm"
else
    sh "./sbatch.aaatm.slurm" > "jacobi.aaatm" 2> "stderr.aaatm"
fi

# launch job for aaatn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatn.slurm"
else
    sh "./sbatch.aaatn.slurm" > "jacobi.aaatn" 2> "stderr.aaatn"
fi

# launch job for aaato
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaato.slurm"
else
    sh "./sbatch.aaato.slurm" > "jacobi.aaato" 2> "stderr.aaato"
fi

# launch job for aaatp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatp.slurm"
else
    sh "./sbatch.aaatp.slurm" > "jacobi.aaatp" 2> "stderr.aaatp"
fi

# launch job for aaatq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatq.slurm"
else
    sh "./sbatch.aaatq.slurm" > "jacobi.aaatq" 2> "stderr.aaatq"
fi

# launch job for aaatr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatr.slurm"
else
    sh "./sbatch.aaatr.slurm" > "jacobi.aaatr" 2> "stderr.aaatr"
fi

# launch job for aaats
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaats.slurm"
else
    sh "./sbatch.aaats.slurm" > "jacobi.aaats" 2> "stderr.aaats"
fi

# launch job for aaatt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatt.slurm"
else
    sh "./sbatch.aaatt.slurm" > "jacobi.aaatt" 2> "stderr.aaatt"
fi

# launch job for aaatu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatu.slurm"
else
    sh "./sbatch.aaatu.slurm" > "jacobi.aaatu" 2> "stderr.aaatu"
fi

# launch job for aaatv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatv.slurm"
else
    sh "./sbatch.aaatv.slurm" > "jacobi.aaatv" 2> "stderr.aaatv"
fi

# launch job for aaatw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatw.slurm"
else
    sh "./sbatch.aaatw.slurm" > "jacobi.aaatw" 2> "stderr.aaatw"
fi

# launch job for aaatx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatx.slurm"
else
    sh "./sbatch.aaatx.slurm" > "jacobi.aaatx" 2> "stderr.aaatx"
fi

# launch job for aaaty
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaty.slurm"
else
    sh "./sbatch.aaaty.slurm" > "jacobi.aaaty" 2> "stderr.aaaty"
fi

# launch job for aaatz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaatz.slurm"
else
    sh "./sbatch.aaatz.slurm" > "jacobi.aaatz" 2> "stderr.aaatz"
fi

# launch job for aaaua
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaua.slurm"
else
    sh "./sbatch.aaaua.slurm" > "jacobi.aaaua" 2> "stderr.aaaua"
fi

# launch job for aaaub
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaub.slurm"
else
    sh "./sbatch.aaaub.slurm" > "jacobi.aaaub" 2> "stderr.aaaub"
fi

# launch job for aaauc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauc.slurm"
else
    sh "./sbatch.aaauc.slurm" > "jacobi.aaauc" 2> "stderr.aaauc"
fi

# launch job for aaaud
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaud.slurm"
else
    sh "./sbatch.aaaud.slurm" > "jacobi.aaaud" 2> "stderr.aaaud"
fi

# launch job for aaaue
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaue.slurm"
else
    sh "./sbatch.aaaue.slurm" > "jacobi.aaaue" 2> "stderr.aaaue"
fi

# launch job for aaauf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauf.slurm"
else
    sh "./sbatch.aaauf.slurm" > "jacobi.aaauf" 2> "stderr.aaauf"
fi

# launch job for aaaug
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaug.slurm"
else
    sh "./sbatch.aaaug.slurm" > "jacobi.aaaug" 2> "stderr.aaaug"
fi

# launch job for aaauh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauh.slurm"
else
    sh "./sbatch.aaauh.slurm" > "jacobi.aaauh" 2> "stderr.aaauh"
fi

# launch job for aaaui
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaui.slurm"
else
    sh "./sbatch.aaaui.slurm" > "jacobi.aaaui" 2> "stderr.aaaui"
fi

# launch job for aaauj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauj.slurm"
else
    sh "./sbatch.aaauj.slurm" > "jacobi.aaauj" 2> "stderr.aaauj"
fi

# launch job for aaauk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauk.slurm"
else
    sh "./sbatch.aaauk.slurm" > "jacobi.aaauk" 2> "stderr.aaauk"
fi

# launch job for aaaul
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaul.slurm"
else
    sh "./sbatch.aaaul.slurm" > "jacobi.aaaul" 2> "stderr.aaaul"
fi

# launch job for aaaum
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaum.slurm"
else
    sh "./sbatch.aaaum.slurm" > "jacobi.aaaum" 2> "stderr.aaaum"
fi

# launch job for aaaun
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaun.slurm"
else
    sh "./sbatch.aaaun.slurm" > "jacobi.aaaun" 2> "stderr.aaaun"
fi

# launch job for aaauo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauo.slurm"
else
    sh "./sbatch.aaauo.slurm" > "jacobi.aaauo" 2> "stderr.aaauo"
fi

# launch job for aaaup
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaup.slurm"
else
    sh "./sbatch.aaaup.slurm" > "jacobi.aaaup" 2> "stderr.aaaup"
fi

# launch job for aaauq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauq.slurm"
else
    sh "./sbatch.aaauq.slurm" > "jacobi.aaauq" 2> "stderr.aaauq"
fi

# launch job for aaaur
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaur.slurm"
else
    sh "./sbatch.aaaur.slurm" > "jacobi.aaaur" 2> "stderr.aaaur"
fi

# launch job for aaaus
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaus.slurm"
else
    sh "./sbatch.aaaus.slurm" > "jacobi.aaaus" 2> "stderr.aaaus"
fi

# launch job for aaaut
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaut.slurm"
else
    sh "./sbatch.aaaut.slurm" > "jacobi.aaaut" 2> "stderr.aaaut"
fi

# launch job for aaauu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauu.slurm"
else
    sh "./sbatch.aaauu.slurm" > "jacobi.aaauu" 2> "stderr.aaauu"
fi

# launch job for aaauv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauv.slurm"
else
    sh "./sbatch.aaauv.slurm" > "jacobi.aaauv" 2> "stderr.aaauv"
fi

# launch job for aaauw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauw.slurm"
else
    sh "./sbatch.aaauw.slurm" > "jacobi.aaauw" 2> "stderr.aaauw"
fi

# launch job for aaaux
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaux.slurm"
else
    sh "./sbatch.aaaux.slurm" > "jacobi.aaaux" 2> "stderr.aaaux"
fi

# launch job for aaauy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauy.slurm"
else
    sh "./sbatch.aaauy.slurm" > "jacobi.aaauy" 2> "stderr.aaauy"
fi

# launch job for aaauz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaauz.slurm"
else
    sh "./sbatch.aaauz.slurm" > "jacobi.aaauz" 2> "stderr.aaauz"
fi

# launch job for aaava
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaava.slurm"
else
    sh "./sbatch.aaava.slurm" > "jacobi.aaava" 2> "stderr.aaava"
fi

# launch job for aaavb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavb.slurm"
else
    sh "./sbatch.aaavb.slurm" > "jacobi.aaavb" 2> "stderr.aaavb"
fi

# launch job for aaavc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavc.slurm"
else
    sh "./sbatch.aaavc.slurm" > "jacobi.aaavc" 2> "stderr.aaavc"
fi

# launch job for aaavd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavd.slurm"
else
    sh "./sbatch.aaavd.slurm" > "jacobi.aaavd" 2> "stderr.aaavd"
fi

# launch job for aaave
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaave.slurm"
else
    sh "./sbatch.aaave.slurm" > "jacobi.aaave" 2> "stderr.aaave"
fi

# launch job for aaavf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavf.slurm"
else
    sh "./sbatch.aaavf.slurm" > "jacobi.aaavf" 2> "stderr.aaavf"
fi

# launch job for aaavg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavg.slurm"
else
    sh "./sbatch.aaavg.slurm" > "jacobi.aaavg" 2> "stderr.aaavg"
fi

# launch job for aaavh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavh.slurm"
else
    sh "./sbatch.aaavh.slurm" > "jacobi.aaavh" 2> "stderr.aaavh"
fi

# launch job for aaavi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavi.slurm"
else
    sh "./sbatch.aaavi.slurm" > "jacobi.aaavi" 2> "stderr.aaavi"
fi

# launch job for aaavj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavj.slurm"
else
    sh "./sbatch.aaavj.slurm" > "jacobi.aaavj" 2> "stderr.aaavj"
fi

# launch job for aaavk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavk.slurm"
else
    sh "./sbatch.aaavk.slurm" > "jacobi.aaavk" 2> "stderr.aaavk"
fi

# launch job for aaavl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavl.slurm"
else
    sh "./sbatch.aaavl.slurm" > "jacobi.aaavl" 2> "stderr.aaavl"
fi

# launch job for aaavm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavm.slurm"
else
    sh "./sbatch.aaavm.slurm" > "jacobi.aaavm" 2> "stderr.aaavm"
fi

# launch job for aaavn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavn.slurm"
else
    sh "./sbatch.aaavn.slurm" > "jacobi.aaavn" 2> "stderr.aaavn"
fi

# launch job for aaavo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavo.slurm"
else
    sh "./sbatch.aaavo.slurm" > "jacobi.aaavo" 2> "stderr.aaavo"
fi

# launch job for aaavp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavp.slurm"
else
    sh "./sbatch.aaavp.slurm" > "jacobi.aaavp" 2> "stderr.aaavp"
fi

# launch job for aaavq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavq.slurm"
else
    sh "./sbatch.aaavq.slurm" > "jacobi.aaavq" 2> "stderr.aaavq"
fi

# launch job for aaavr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavr.slurm"
else
    sh "./sbatch.aaavr.slurm" > "jacobi.aaavr" 2> "stderr.aaavr"
fi

# launch job for aaavs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavs.slurm"
else
    sh "./sbatch.aaavs.slurm" > "jacobi.aaavs" 2> "stderr.aaavs"
fi

# launch job for aaavt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavt.slurm"
else
    sh "./sbatch.aaavt.slurm" > "jacobi.aaavt" 2> "stderr.aaavt"
fi

# launch job for aaavu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavu.slurm"
else
    sh "./sbatch.aaavu.slurm" > "jacobi.aaavu" 2> "stderr.aaavu"
fi

# launch job for aaavv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavv.slurm"
else
    sh "./sbatch.aaavv.slurm" > "jacobi.aaavv" 2> "stderr.aaavv"
fi

# launch job for aaavw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavw.slurm"
else
    sh "./sbatch.aaavw.slurm" > "jacobi.aaavw" 2> "stderr.aaavw"
fi

# launch job for aaavx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavx.slurm"
else
    sh "./sbatch.aaavx.slurm" > "jacobi.aaavx" 2> "stderr.aaavx"
fi

# launch job for aaavy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavy.slurm"
else
    sh "./sbatch.aaavy.slurm" > "jacobi.aaavy" 2> "stderr.aaavy"
fi

# launch job for aaavz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaavz.slurm"
else
    sh "./sbatch.aaavz.slurm" > "jacobi.aaavz" 2> "stderr.aaavz"
fi

# launch job for aaawa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawa.slurm"
else
    sh "./sbatch.aaawa.slurm" > "jacobi.aaawa" 2> "stderr.aaawa"
fi

# launch job for aaawb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawb.slurm"
else
    sh "./sbatch.aaawb.slurm" > "jacobi.aaawb" 2> "stderr.aaawb"
fi

# launch job for aaawc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawc.slurm"
else
    sh "./sbatch.aaawc.slurm" > "jacobi.aaawc" 2> "stderr.aaawc"
fi

# launch job for aaawd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawd.slurm"
else
    sh "./sbatch.aaawd.slurm" > "jacobi.aaawd" 2> "stderr.aaawd"
fi

# launch job for aaawe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawe.slurm"
else
    sh "./sbatch.aaawe.slurm" > "jacobi.aaawe" 2> "stderr.aaawe"
fi

# launch job for aaawf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawf.slurm"
else
    sh "./sbatch.aaawf.slurm" > "jacobi.aaawf" 2> "stderr.aaawf"
fi

# launch job for aaawg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawg.slurm"
else
    sh "./sbatch.aaawg.slurm" > "jacobi.aaawg" 2> "stderr.aaawg"
fi

# launch job for aaawh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawh.slurm"
else
    sh "./sbatch.aaawh.slurm" > "jacobi.aaawh" 2> "stderr.aaawh"
fi

# launch job for aaawi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawi.slurm"
else
    sh "./sbatch.aaawi.slurm" > "jacobi.aaawi" 2> "stderr.aaawi"
fi

# launch job for aaawj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawj.slurm"
else
    sh "./sbatch.aaawj.slurm" > "jacobi.aaawj" 2> "stderr.aaawj"
fi

# launch job for aaawk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawk.slurm"
else
    sh "./sbatch.aaawk.slurm" > "jacobi.aaawk" 2> "stderr.aaawk"
fi

# launch job for aaawl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawl.slurm"
else
    sh "./sbatch.aaawl.slurm" > "jacobi.aaawl" 2> "stderr.aaawl"
fi

# launch job for aaawm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawm.slurm"
else
    sh "./sbatch.aaawm.slurm" > "jacobi.aaawm" 2> "stderr.aaawm"
fi

# launch job for aaawn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawn.slurm"
else
    sh "./sbatch.aaawn.slurm" > "jacobi.aaawn" 2> "stderr.aaawn"
fi

# launch job for aaawo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawo.slurm"
else
    sh "./sbatch.aaawo.slurm" > "jacobi.aaawo" 2> "stderr.aaawo"
fi

# launch job for aaawp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawp.slurm"
else
    sh "./sbatch.aaawp.slurm" > "jacobi.aaawp" 2> "stderr.aaawp"
fi

# launch job for aaawq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawq.slurm"
else
    sh "./sbatch.aaawq.slurm" > "jacobi.aaawq" 2> "stderr.aaawq"
fi

# launch job for aaawr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawr.slurm"
else
    sh "./sbatch.aaawr.slurm" > "jacobi.aaawr" 2> "stderr.aaawr"
fi

# launch job for aaaws
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaws.slurm"
else
    sh "./sbatch.aaaws.slurm" > "jacobi.aaaws" 2> "stderr.aaaws"
fi

# launch job for aaawt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawt.slurm"
else
    sh "./sbatch.aaawt.slurm" > "jacobi.aaawt" 2> "stderr.aaawt"
fi

# launch job for aaawu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawu.slurm"
else
    sh "./sbatch.aaawu.slurm" > "jacobi.aaawu" 2> "stderr.aaawu"
fi

# launch job for aaawv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawv.slurm"
else
    sh "./sbatch.aaawv.slurm" > "jacobi.aaawv" 2> "stderr.aaawv"
fi

# launch job for aaaww
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaww.slurm"
else
    sh "./sbatch.aaaww.slurm" > "jacobi.aaaww" 2> "stderr.aaaww"
fi

# launch job for aaawx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawx.slurm"
else
    sh "./sbatch.aaawx.slurm" > "jacobi.aaawx" 2> "stderr.aaawx"
fi

# launch job for aaawy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawy.slurm"
else
    sh "./sbatch.aaawy.slurm" > "jacobi.aaawy" 2> "stderr.aaawy"
fi

# launch job for aaawz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaawz.slurm"
else
    sh "./sbatch.aaawz.slurm" > "jacobi.aaawz" 2> "stderr.aaawz"
fi

# launch job for aaaxa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxa.slurm"
else
    sh "./sbatch.aaaxa.slurm" > "jacobi.aaaxa" 2> "stderr.aaaxa"
fi

# launch job for aaaxb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxb.slurm"
else
    sh "./sbatch.aaaxb.slurm" > "jacobi.aaaxb" 2> "stderr.aaaxb"
fi

# launch job for aaaxc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxc.slurm"
else
    sh "./sbatch.aaaxc.slurm" > "jacobi.aaaxc" 2> "stderr.aaaxc"
fi

# launch job for aaaxd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxd.slurm"
else
    sh "./sbatch.aaaxd.slurm" > "jacobi.aaaxd" 2> "stderr.aaaxd"
fi

# launch job for aaaxe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxe.slurm"
else
    sh "./sbatch.aaaxe.slurm" > "jacobi.aaaxe" 2> "stderr.aaaxe"
fi

# launch job for aaaxf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxf.slurm"
else
    sh "./sbatch.aaaxf.slurm" > "jacobi.aaaxf" 2> "stderr.aaaxf"
fi

# launch job for aaaxg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxg.slurm"
else
    sh "./sbatch.aaaxg.slurm" > "jacobi.aaaxg" 2> "stderr.aaaxg"
fi

# launch job for aaaxh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxh.slurm"
else
    sh "./sbatch.aaaxh.slurm" > "jacobi.aaaxh" 2> "stderr.aaaxh"
fi

# launch job for aaaxi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxi.slurm"
else
    sh "./sbatch.aaaxi.slurm" > "jacobi.aaaxi" 2> "stderr.aaaxi"
fi

# launch job for aaaxj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxj.slurm"
else
    sh "./sbatch.aaaxj.slurm" > "jacobi.aaaxj" 2> "stderr.aaaxj"
fi

# launch job for aaaxk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxk.slurm"
else
    sh "./sbatch.aaaxk.slurm" > "jacobi.aaaxk" 2> "stderr.aaaxk"
fi

# launch job for aaaxl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxl.slurm"
else
    sh "./sbatch.aaaxl.slurm" > "jacobi.aaaxl" 2> "stderr.aaaxl"
fi

# launch job for aaaxm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxm.slurm"
else
    sh "./sbatch.aaaxm.slurm" > "jacobi.aaaxm" 2> "stderr.aaaxm"
fi

# launch job for aaaxn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxn.slurm"
else
    sh "./sbatch.aaaxn.slurm" > "jacobi.aaaxn" 2> "stderr.aaaxn"
fi

# launch job for aaaxo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxo.slurm"
else
    sh "./sbatch.aaaxo.slurm" > "jacobi.aaaxo" 2> "stderr.aaaxo"
fi

# launch job for aaaxp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxp.slurm"
else
    sh "./sbatch.aaaxp.slurm" > "jacobi.aaaxp" 2> "stderr.aaaxp"
fi

# launch job for aaaxq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxq.slurm"
else
    sh "./sbatch.aaaxq.slurm" > "jacobi.aaaxq" 2> "stderr.aaaxq"
fi

# launch job for aaaxr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxr.slurm"
else
    sh "./sbatch.aaaxr.slurm" > "jacobi.aaaxr" 2> "stderr.aaaxr"
fi

# launch job for aaaxs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxs.slurm"
else
    sh "./sbatch.aaaxs.slurm" > "jacobi.aaaxs" 2> "stderr.aaaxs"
fi

# launch job for aaaxt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxt.slurm"
else
    sh "./sbatch.aaaxt.slurm" > "jacobi.aaaxt" 2> "stderr.aaaxt"
fi

# launch job for aaaxu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxu.slurm"
else
    sh "./sbatch.aaaxu.slurm" > "jacobi.aaaxu" 2> "stderr.aaaxu"
fi

# launch job for aaaxv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxv.slurm"
else
    sh "./sbatch.aaaxv.slurm" > "jacobi.aaaxv" 2> "stderr.aaaxv"
fi

# launch job for aaaxw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxw.slurm"
else
    sh "./sbatch.aaaxw.slurm" > "jacobi.aaaxw" 2> "stderr.aaaxw"
fi

# launch job for aaaxx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxx.slurm"
else
    sh "./sbatch.aaaxx.slurm" > "jacobi.aaaxx" 2> "stderr.aaaxx"
fi

# launch job for aaaxy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxy.slurm"
else
    sh "./sbatch.aaaxy.slurm" > "jacobi.aaaxy" 2> "stderr.aaaxy"
fi

# launch job for aaaxz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaxz.slurm"
else
    sh "./sbatch.aaaxz.slurm" > "jacobi.aaaxz" 2> "stderr.aaaxz"
fi

# launch job for aaaya
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaya.slurm"
else
    sh "./sbatch.aaaya.slurm" > "jacobi.aaaya" 2> "stderr.aaaya"
fi

# launch job for aaayb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayb.slurm"
else
    sh "./sbatch.aaayb.slurm" > "jacobi.aaayb" 2> "stderr.aaayb"
fi

# launch job for aaayc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayc.slurm"
else
    sh "./sbatch.aaayc.slurm" > "jacobi.aaayc" 2> "stderr.aaayc"
fi

# launch job for aaayd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayd.slurm"
else
    sh "./sbatch.aaayd.slurm" > "jacobi.aaayd" 2> "stderr.aaayd"
fi

# launch job for aaaye
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaye.slurm"
else
    sh "./sbatch.aaaye.slurm" > "jacobi.aaaye" 2> "stderr.aaaye"
fi

# launch job for aaayf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayf.slurm"
else
    sh "./sbatch.aaayf.slurm" > "jacobi.aaayf" 2> "stderr.aaayf"
fi

# launch job for aaayg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayg.slurm"
else
    sh "./sbatch.aaayg.slurm" > "jacobi.aaayg" 2> "stderr.aaayg"
fi

# launch job for aaayh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayh.slurm"
else
    sh "./sbatch.aaayh.slurm" > "jacobi.aaayh" 2> "stderr.aaayh"
fi

# launch job for aaayi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayi.slurm"
else
    sh "./sbatch.aaayi.slurm" > "jacobi.aaayi" 2> "stderr.aaayi"
fi

# launch job for aaayj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayj.slurm"
else
    sh "./sbatch.aaayj.slurm" > "jacobi.aaayj" 2> "stderr.aaayj"
fi

# launch job for aaayk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayk.slurm"
else
    sh "./sbatch.aaayk.slurm" > "jacobi.aaayk" 2> "stderr.aaayk"
fi

# launch job for aaayl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayl.slurm"
else
    sh "./sbatch.aaayl.slurm" > "jacobi.aaayl" 2> "stderr.aaayl"
fi

# launch job for aaaym
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaym.slurm"
else
    sh "./sbatch.aaaym.slurm" > "jacobi.aaaym" 2> "stderr.aaaym"
fi

# launch job for aaayn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayn.slurm"
else
    sh "./sbatch.aaayn.slurm" > "jacobi.aaayn" 2> "stderr.aaayn"
fi

# launch job for aaayo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayo.slurm"
else
    sh "./sbatch.aaayo.slurm" > "jacobi.aaayo" 2> "stderr.aaayo"
fi

# launch job for aaayp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayp.slurm"
else
    sh "./sbatch.aaayp.slurm" > "jacobi.aaayp" 2> "stderr.aaayp"
fi

# launch job for aaayq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayq.slurm"
else
    sh "./sbatch.aaayq.slurm" > "jacobi.aaayq" 2> "stderr.aaayq"
fi

# launch job for aaayr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayr.slurm"
else
    sh "./sbatch.aaayr.slurm" > "jacobi.aaayr" 2> "stderr.aaayr"
fi

# launch job for aaays
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaays.slurm"
else
    sh "./sbatch.aaays.slurm" > "jacobi.aaays" 2> "stderr.aaays"
fi

# launch job for aaayt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayt.slurm"
else
    sh "./sbatch.aaayt.slurm" > "jacobi.aaayt" 2> "stderr.aaayt"
fi

# launch job for aaayu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayu.slurm"
else
    sh "./sbatch.aaayu.slurm" > "jacobi.aaayu" 2> "stderr.aaayu"
fi

# launch job for aaayv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayv.slurm"
else
    sh "./sbatch.aaayv.slurm" > "jacobi.aaayv" 2> "stderr.aaayv"
fi

# launch job for aaayw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayw.slurm"
else
    sh "./sbatch.aaayw.slurm" > "jacobi.aaayw" 2> "stderr.aaayw"
fi

# launch job for aaayx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayx.slurm"
else
    sh "./sbatch.aaayx.slurm" > "jacobi.aaayx" 2> "stderr.aaayx"
fi

# launch job for aaayy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayy.slurm"
else
    sh "./sbatch.aaayy.slurm" > "jacobi.aaayy" 2> "stderr.aaayy"
fi

# launch job for aaayz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaayz.slurm"
else
    sh "./sbatch.aaayz.slurm" > "jacobi.aaayz" 2> "stderr.aaayz"
fi

# launch job for aaaza
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaza.slurm"
else
    sh "./sbatch.aaaza.slurm" > "jacobi.aaaza" 2> "stderr.aaaza"
fi

# launch job for aaazb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazb.slurm"
else
    sh "./sbatch.aaazb.slurm" > "jacobi.aaazb" 2> "stderr.aaazb"
fi

# launch job for aaazc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazc.slurm"
else
    sh "./sbatch.aaazc.slurm" > "jacobi.aaazc" 2> "stderr.aaazc"
fi

# launch job for aaazd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazd.slurm"
else
    sh "./sbatch.aaazd.slurm" > "jacobi.aaazd" 2> "stderr.aaazd"
fi

# launch job for aaaze
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaaze.slurm"
else
    sh "./sbatch.aaaze.slurm" > "jacobi.aaaze" 2> "stderr.aaaze"
fi

# launch job for aaazf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazf.slurm"
else
    sh "./sbatch.aaazf.slurm" > "jacobi.aaazf" 2> "stderr.aaazf"
fi

# launch job for aaazg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazg.slurm"
else
    sh "./sbatch.aaazg.slurm" > "jacobi.aaazg" 2> "stderr.aaazg"
fi

# launch job for aaazh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazh.slurm"
else
    sh "./sbatch.aaazh.slurm" > "jacobi.aaazh" 2> "stderr.aaazh"
fi

# launch job for aaazi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazi.slurm"
else
    sh "./sbatch.aaazi.slurm" > "jacobi.aaazi" 2> "stderr.aaazi"
fi

# launch job for aaazj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazj.slurm"
else
    sh "./sbatch.aaazj.slurm" > "jacobi.aaazj" 2> "stderr.aaazj"
fi

# launch job for aaazk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazk.slurm"
else
    sh "./sbatch.aaazk.slurm" > "jacobi.aaazk" 2> "stderr.aaazk"
fi

# launch job for aaazl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazl.slurm"
else
    sh "./sbatch.aaazl.slurm" > "jacobi.aaazl" 2> "stderr.aaazl"
fi

# launch job for aaazm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazm.slurm"
else
    sh "./sbatch.aaazm.slurm" > "jacobi.aaazm" 2> "stderr.aaazm"
fi

# launch job for aaazn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazn.slurm"
else
    sh "./sbatch.aaazn.slurm" > "jacobi.aaazn" 2> "stderr.aaazn"
fi

# launch job for aaazo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazo.slurm"
else
    sh "./sbatch.aaazo.slurm" > "jacobi.aaazo" 2> "stderr.aaazo"
fi

# launch job for aaazp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazp.slurm"
else
    sh "./sbatch.aaazp.slurm" > "jacobi.aaazp" 2> "stderr.aaazp"
fi

# launch job for aaazq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazq.slurm"
else
    sh "./sbatch.aaazq.slurm" > "jacobi.aaazq" 2> "stderr.aaazq"
fi

# launch job for aaazr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazr.slurm"
else
    sh "./sbatch.aaazr.slurm" > "jacobi.aaazr" 2> "stderr.aaazr"
fi

# launch job for aaazs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazs.slurm"
else
    sh "./sbatch.aaazs.slurm" > "jacobi.aaazs" 2> "stderr.aaazs"
fi

# launch job for aaazt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazt.slurm"
else
    sh "./sbatch.aaazt.slurm" > "jacobi.aaazt" 2> "stderr.aaazt"
fi

# launch job for aaazu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazu.slurm"
else
    sh "./sbatch.aaazu.slurm" > "jacobi.aaazu" 2> "stderr.aaazu"
fi

# launch job for aaazv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazv.slurm"
else
    sh "./sbatch.aaazv.slurm" > "jacobi.aaazv" 2> "stderr.aaazv"
fi

# launch job for aaazw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazw.slurm"
else
    sh "./sbatch.aaazw.slurm" > "jacobi.aaazw" 2> "stderr.aaazw"
fi

# launch job for aaazx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazx.slurm"
else
    sh "./sbatch.aaazx.slurm" > "jacobi.aaazx" 2> "stderr.aaazx"
fi

# launch job for aaazy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazy.slurm"
else
    sh "./sbatch.aaazy.slurm" > "jacobi.aaazy" 2> "stderr.aaazy"
fi

# launch job for aaazz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaazz.slurm"
else
    sh "./sbatch.aaazz.slurm" > "jacobi.aaazz" 2> "stderr.aaazz"
fi

# launch job for aabaa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabaa.slurm"
else
    sh "./sbatch.aabaa.slurm" > "jacobi.aabaa" 2> "stderr.aabaa"
fi

# launch job for aabab
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabab.slurm"
else
    sh "./sbatch.aabab.slurm" > "jacobi.aabab" 2> "stderr.aabab"
fi

# launch job for aabac
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabac.slurm"
else
    sh "./sbatch.aabac.slurm" > "jacobi.aabac" 2> "stderr.aabac"
fi

# launch job for aabad
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabad.slurm"
else
    sh "./sbatch.aabad.slurm" > "jacobi.aabad" 2> "stderr.aabad"
fi

# launch job for aabae
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabae.slurm"
else
    sh "./sbatch.aabae.slurm" > "jacobi.aabae" 2> "stderr.aabae"
fi

# launch job for aabaf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabaf.slurm"
else
    sh "./sbatch.aabaf.slurm" > "jacobi.aabaf" 2> "stderr.aabaf"
fi

# launch job for aabag
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabag.slurm"
else
    sh "./sbatch.aabag.slurm" > "jacobi.aabag" 2> "stderr.aabag"
fi

# launch job for aabah
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabah.slurm"
else
    sh "./sbatch.aabah.slurm" > "jacobi.aabah" 2> "stderr.aabah"
fi

# launch job for aabai
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabai.slurm"
else
    sh "./sbatch.aabai.slurm" > "jacobi.aabai" 2> "stderr.aabai"
fi

# launch job for aabaj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabaj.slurm"
else
    sh "./sbatch.aabaj.slurm" > "jacobi.aabaj" 2> "stderr.aabaj"
fi

# launch job for aabak
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabak.slurm"
else
    sh "./sbatch.aabak.slurm" > "jacobi.aabak" 2> "stderr.aabak"
fi

# launch job for aabal
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabal.slurm"
else
    sh "./sbatch.aabal.slurm" > "jacobi.aabal" 2> "stderr.aabal"
fi

# launch job for aabam
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabam.slurm"
else
    sh "./sbatch.aabam.slurm" > "jacobi.aabam" 2> "stderr.aabam"
fi

# launch job for aaban
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaban.slurm"
else
    sh "./sbatch.aaban.slurm" > "jacobi.aaban" 2> "stderr.aaban"
fi

# launch job for aabao
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabao.slurm"
else
    sh "./sbatch.aabao.slurm" > "jacobi.aabao" 2> "stderr.aabao"
fi

# launch job for aabap
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabap.slurm"
else
    sh "./sbatch.aabap.slurm" > "jacobi.aabap" 2> "stderr.aabap"
fi

# launch job for aabaq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabaq.slurm"
else
    sh "./sbatch.aabaq.slurm" > "jacobi.aabaq" 2> "stderr.aabaq"
fi

# launch job for aabar
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabar.slurm"
else
    sh "./sbatch.aabar.slurm" > "jacobi.aabar" 2> "stderr.aabar"
fi

# launch job for aabas
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabas.slurm"
else
    sh "./sbatch.aabas.slurm" > "jacobi.aabas" 2> "stderr.aabas"
fi

# launch job for aabat
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabat.slurm"
else
    sh "./sbatch.aabat.slurm" > "jacobi.aabat" 2> "stderr.aabat"
fi

# launch job for aabau
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabau.slurm"
else
    sh "./sbatch.aabau.slurm" > "jacobi.aabau" 2> "stderr.aabau"
fi

# launch job for aabav
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabav.slurm"
else
    sh "./sbatch.aabav.slurm" > "jacobi.aabav" 2> "stderr.aabav"
fi

# launch job for aabaw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabaw.slurm"
else
    sh "./sbatch.aabaw.slurm" > "jacobi.aabaw" 2> "stderr.aabaw"
fi

# launch job for aabax
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabax.slurm"
else
    sh "./sbatch.aabax.slurm" > "jacobi.aabax" 2> "stderr.aabax"
fi

# launch job for aabay
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabay.slurm"
else
    sh "./sbatch.aabay.slurm" > "jacobi.aabay" 2> "stderr.aabay"
fi

# launch job for aabaz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabaz.slurm"
else
    sh "./sbatch.aabaz.slurm" > "jacobi.aabaz" 2> "stderr.aabaz"
fi

# launch job for aabba
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabba.slurm"
else
    sh "./sbatch.aabba.slurm" > "jacobi.aabba" 2> "stderr.aabba"
fi

# launch job for aabbb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbb.slurm"
else
    sh "./sbatch.aabbb.slurm" > "jacobi.aabbb" 2> "stderr.aabbb"
fi

# launch job for aabbc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbc.slurm"
else
    sh "./sbatch.aabbc.slurm" > "jacobi.aabbc" 2> "stderr.aabbc"
fi

# launch job for aabbd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbd.slurm"
else
    sh "./sbatch.aabbd.slurm" > "jacobi.aabbd" 2> "stderr.aabbd"
fi

# launch job for aabbe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbe.slurm"
else
    sh "./sbatch.aabbe.slurm" > "jacobi.aabbe" 2> "stderr.aabbe"
fi

# launch job for aabbf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbf.slurm"
else
    sh "./sbatch.aabbf.slurm" > "jacobi.aabbf" 2> "stderr.aabbf"
fi

# launch job for aabbg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbg.slurm"
else
    sh "./sbatch.aabbg.slurm" > "jacobi.aabbg" 2> "stderr.aabbg"
fi

# launch job for aabbh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbh.slurm"
else
    sh "./sbatch.aabbh.slurm" > "jacobi.aabbh" 2> "stderr.aabbh"
fi

# launch job for aabbi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbi.slurm"
else
    sh "./sbatch.aabbi.slurm" > "jacobi.aabbi" 2> "stderr.aabbi"
fi

# launch job for aabbj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbj.slurm"
else
    sh "./sbatch.aabbj.slurm" > "jacobi.aabbj" 2> "stderr.aabbj"
fi

# launch job for aabbk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbk.slurm"
else
    sh "./sbatch.aabbk.slurm" > "jacobi.aabbk" 2> "stderr.aabbk"
fi

# launch job for aabbl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbl.slurm"
else
    sh "./sbatch.aabbl.slurm" > "jacobi.aabbl" 2> "stderr.aabbl"
fi

# launch job for aabbm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbm.slurm"
else
    sh "./sbatch.aabbm.slurm" > "jacobi.aabbm" 2> "stderr.aabbm"
fi

# launch job for aabbn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbn.slurm"
else
    sh "./sbatch.aabbn.slurm" > "jacobi.aabbn" 2> "stderr.aabbn"
fi

# launch job for aabbo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbo.slurm"
else
    sh "./sbatch.aabbo.slurm" > "jacobi.aabbo" 2> "stderr.aabbo"
fi

# launch job for aabbp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbp.slurm"
else
    sh "./sbatch.aabbp.slurm" > "jacobi.aabbp" 2> "stderr.aabbp"
fi

# launch job for aabbq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbq.slurm"
else
    sh "./sbatch.aabbq.slurm" > "jacobi.aabbq" 2> "stderr.aabbq"
fi

# launch job for aabbr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbr.slurm"
else
    sh "./sbatch.aabbr.slurm" > "jacobi.aabbr" 2> "stderr.aabbr"
fi

# launch job for aabbs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbs.slurm"
else
    sh "./sbatch.aabbs.slurm" > "jacobi.aabbs" 2> "stderr.aabbs"
fi

# launch job for aabbt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbt.slurm"
else
    sh "./sbatch.aabbt.slurm" > "jacobi.aabbt" 2> "stderr.aabbt"
fi

# launch job for aabbu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbu.slurm"
else
    sh "./sbatch.aabbu.slurm" > "jacobi.aabbu" 2> "stderr.aabbu"
fi

# launch job for aabbv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbv.slurm"
else
    sh "./sbatch.aabbv.slurm" > "jacobi.aabbv" 2> "stderr.aabbv"
fi

# launch job for aabbw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbw.slurm"
else
    sh "./sbatch.aabbw.slurm" > "jacobi.aabbw" 2> "stderr.aabbw"
fi

# launch job for aabbx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbx.slurm"
else
    sh "./sbatch.aabbx.slurm" > "jacobi.aabbx" 2> "stderr.aabbx"
fi

# launch job for aabby
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabby.slurm"
else
    sh "./sbatch.aabby.slurm" > "jacobi.aabby" 2> "stderr.aabby"
fi

# launch job for aabbz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabbz.slurm"
else
    sh "./sbatch.aabbz.slurm" > "jacobi.aabbz" 2> "stderr.aabbz"
fi

# launch job for aabca
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabca.slurm"
else
    sh "./sbatch.aabca.slurm" > "jacobi.aabca" 2> "stderr.aabca"
fi

# launch job for aabcb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcb.slurm"
else
    sh "./sbatch.aabcb.slurm" > "jacobi.aabcb" 2> "stderr.aabcb"
fi

# launch job for aabcc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcc.slurm"
else
    sh "./sbatch.aabcc.slurm" > "jacobi.aabcc" 2> "stderr.aabcc"
fi

# launch job for aabcd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcd.slurm"
else
    sh "./sbatch.aabcd.slurm" > "jacobi.aabcd" 2> "stderr.aabcd"
fi

# launch job for aabce
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabce.slurm"
else
    sh "./sbatch.aabce.slurm" > "jacobi.aabce" 2> "stderr.aabce"
fi

# launch job for aabcf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcf.slurm"
else
    sh "./sbatch.aabcf.slurm" > "jacobi.aabcf" 2> "stderr.aabcf"
fi

# launch job for aabcg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcg.slurm"
else
    sh "./sbatch.aabcg.slurm" > "jacobi.aabcg" 2> "stderr.aabcg"
fi

# launch job for aabch
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabch.slurm"
else
    sh "./sbatch.aabch.slurm" > "jacobi.aabch" 2> "stderr.aabch"
fi

# launch job for aabci
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabci.slurm"
else
    sh "./sbatch.aabci.slurm" > "jacobi.aabci" 2> "stderr.aabci"
fi

# launch job for aabcj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcj.slurm"
else
    sh "./sbatch.aabcj.slurm" > "jacobi.aabcj" 2> "stderr.aabcj"
fi

# launch job for aabck
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabck.slurm"
else
    sh "./sbatch.aabck.slurm" > "jacobi.aabck" 2> "stderr.aabck"
fi

# launch job for aabcl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcl.slurm"
else
    sh "./sbatch.aabcl.slurm" > "jacobi.aabcl" 2> "stderr.aabcl"
fi

# launch job for aabcm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcm.slurm"
else
    sh "./sbatch.aabcm.slurm" > "jacobi.aabcm" 2> "stderr.aabcm"
fi

# launch job for aabcn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcn.slurm"
else
    sh "./sbatch.aabcn.slurm" > "jacobi.aabcn" 2> "stderr.aabcn"
fi

# launch job for aabco
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabco.slurm"
else
    sh "./sbatch.aabco.slurm" > "jacobi.aabco" 2> "stderr.aabco"
fi

# launch job for aabcp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcp.slurm"
else
    sh "./sbatch.aabcp.slurm" > "jacobi.aabcp" 2> "stderr.aabcp"
fi

# launch job for aabcq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcq.slurm"
else
    sh "./sbatch.aabcq.slurm" > "jacobi.aabcq" 2> "stderr.aabcq"
fi

# launch job for aabcr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcr.slurm"
else
    sh "./sbatch.aabcr.slurm" > "jacobi.aabcr" 2> "stderr.aabcr"
fi

# launch job for aabcs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcs.slurm"
else
    sh "./sbatch.aabcs.slurm" > "jacobi.aabcs" 2> "stderr.aabcs"
fi

# launch job for aabct
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabct.slurm"
else
    sh "./sbatch.aabct.slurm" > "jacobi.aabct" 2> "stderr.aabct"
fi

# launch job for aabcu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcu.slurm"
else
    sh "./sbatch.aabcu.slurm" > "jacobi.aabcu" 2> "stderr.aabcu"
fi

# launch job for aabcv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcv.slurm"
else
    sh "./sbatch.aabcv.slurm" > "jacobi.aabcv" 2> "stderr.aabcv"
fi

# launch job for aabcw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcw.slurm"
else
    sh "./sbatch.aabcw.slurm" > "jacobi.aabcw" 2> "stderr.aabcw"
fi

# launch job for aabcx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcx.slurm"
else
    sh "./sbatch.aabcx.slurm" > "jacobi.aabcx" 2> "stderr.aabcx"
fi

# launch job for aabcy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcy.slurm"
else
    sh "./sbatch.aabcy.slurm" > "jacobi.aabcy" 2> "stderr.aabcy"
fi

# launch job for aabcz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabcz.slurm"
else
    sh "./sbatch.aabcz.slurm" > "jacobi.aabcz" 2> "stderr.aabcz"
fi

# launch job for aabda
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabda.slurm"
else
    sh "./sbatch.aabda.slurm" > "jacobi.aabda" 2> "stderr.aabda"
fi

# launch job for aabdb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdb.slurm"
else
    sh "./sbatch.aabdb.slurm" > "jacobi.aabdb" 2> "stderr.aabdb"
fi

# launch job for aabdc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdc.slurm"
else
    sh "./sbatch.aabdc.slurm" > "jacobi.aabdc" 2> "stderr.aabdc"
fi

# launch job for aabdd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdd.slurm"
else
    sh "./sbatch.aabdd.slurm" > "jacobi.aabdd" 2> "stderr.aabdd"
fi

# launch job for aabde
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabde.slurm"
else
    sh "./sbatch.aabde.slurm" > "jacobi.aabde" 2> "stderr.aabde"
fi

# launch job for aabdf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdf.slurm"
else
    sh "./sbatch.aabdf.slurm" > "jacobi.aabdf" 2> "stderr.aabdf"
fi

# launch job for aabdg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdg.slurm"
else
    sh "./sbatch.aabdg.slurm" > "jacobi.aabdg" 2> "stderr.aabdg"
fi

# launch job for aabdh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdh.slurm"
else
    sh "./sbatch.aabdh.slurm" > "jacobi.aabdh" 2> "stderr.aabdh"
fi

# launch job for aabdi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdi.slurm"
else
    sh "./sbatch.aabdi.slurm" > "jacobi.aabdi" 2> "stderr.aabdi"
fi

# launch job for aabdj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdj.slurm"
else
    sh "./sbatch.aabdj.slurm" > "jacobi.aabdj" 2> "stderr.aabdj"
fi

# launch job for aabdk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdk.slurm"
else
    sh "./sbatch.aabdk.slurm" > "jacobi.aabdk" 2> "stderr.aabdk"
fi

# launch job for aabdl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdl.slurm"
else
    sh "./sbatch.aabdl.slurm" > "jacobi.aabdl" 2> "stderr.aabdl"
fi

# launch job for aabdm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdm.slurm"
else
    sh "./sbatch.aabdm.slurm" > "jacobi.aabdm" 2> "stderr.aabdm"
fi

# launch job for aabdn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdn.slurm"
else
    sh "./sbatch.aabdn.slurm" > "jacobi.aabdn" 2> "stderr.aabdn"
fi

# launch job for aabdo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdo.slurm"
else
    sh "./sbatch.aabdo.slurm" > "jacobi.aabdo" 2> "stderr.aabdo"
fi

# launch job for aabdp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdp.slurm"
else
    sh "./sbatch.aabdp.slurm" > "jacobi.aabdp" 2> "stderr.aabdp"
fi

# launch job for aabdq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdq.slurm"
else
    sh "./sbatch.aabdq.slurm" > "jacobi.aabdq" 2> "stderr.aabdq"
fi

# launch job for aabdr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdr.slurm"
else
    sh "./sbatch.aabdr.slurm" > "jacobi.aabdr" 2> "stderr.aabdr"
fi

# launch job for aabds
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabds.slurm"
else
    sh "./sbatch.aabds.slurm" > "jacobi.aabds" 2> "stderr.aabds"
fi

# launch job for aabdt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdt.slurm"
else
    sh "./sbatch.aabdt.slurm" > "jacobi.aabdt" 2> "stderr.aabdt"
fi

# launch job for aabdu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdu.slurm"
else
    sh "./sbatch.aabdu.slurm" > "jacobi.aabdu" 2> "stderr.aabdu"
fi

# launch job for aabdv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdv.slurm"
else
    sh "./sbatch.aabdv.slurm" > "jacobi.aabdv" 2> "stderr.aabdv"
fi

# launch job for aabdw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdw.slurm"
else
    sh "./sbatch.aabdw.slurm" > "jacobi.aabdw" 2> "stderr.aabdw"
fi

# launch job for aabdx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdx.slurm"
else
    sh "./sbatch.aabdx.slurm" > "jacobi.aabdx" 2> "stderr.aabdx"
fi

# launch job for aabdy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdy.slurm"
else
    sh "./sbatch.aabdy.slurm" > "jacobi.aabdy" 2> "stderr.aabdy"
fi

# launch job for aabdz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabdz.slurm"
else
    sh "./sbatch.aabdz.slurm" > "jacobi.aabdz" 2> "stderr.aabdz"
fi

# launch job for aabea
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabea.slurm"
else
    sh "./sbatch.aabea.slurm" > "jacobi.aabea" 2> "stderr.aabea"
fi

# launch job for aabeb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabeb.slurm"
else
    sh "./sbatch.aabeb.slurm" > "jacobi.aabeb" 2> "stderr.aabeb"
fi

# launch job for aabec
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabec.slurm"
else
    sh "./sbatch.aabec.slurm" > "jacobi.aabec" 2> "stderr.aabec"
fi

# launch job for aabed
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabed.slurm"
else
    sh "./sbatch.aabed.slurm" > "jacobi.aabed" 2> "stderr.aabed"
fi

# launch job for aabee
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabee.slurm"
else
    sh "./sbatch.aabee.slurm" > "jacobi.aabee" 2> "stderr.aabee"
fi

# launch job for aabef
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabef.slurm"
else
    sh "./sbatch.aabef.slurm" > "jacobi.aabef" 2> "stderr.aabef"
fi

# launch job for aabeg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabeg.slurm"
else
    sh "./sbatch.aabeg.slurm" > "jacobi.aabeg" 2> "stderr.aabeg"
fi

# launch job for aabeh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabeh.slurm"
else
    sh "./sbatch.aabeh.slurm" > "jacobi.aabeh" 2> "stderr.aabeh"
fi

# launch job for aabei
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabei.slurm"
else
    sh "./sbatch.aabei.slurm" > "jacobi.aabei" 2> "stderr.aabei"
fi

# launch job for aabej
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabej.slurm"
else
    sh "./sbatch.aabej.slurm" > "jacobi.aabej" 2> "stderr.aabej"
fi

# launch job for aabek
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabek.slurm"
else
    sh "./sbatch.aabek.slurm" > "jacobi.aabek" 2> "stderr.aabek"
fi

# launch job for aabel
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabel.slurm"
else
    sh "./sbatch.aabel.slurm" > "jacobi.aabel" 2> "stderr.aabel"
fi

# launch job for aabem
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabem.slurm"
else
    sh "./sbatch.aabem.slurm" > "jacobi.aabem" 2> "stderr.aabem"
fi

# launch job for aaben
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaben.slurm"
else
    sh "./sbatch.aaben.slurm" > "jacobi.aaben" 2> "stderr.aaben"
fi

# launch job for aabeo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabeo.slurm"
else
    sh "./sbatch.aabeo.slurm" > "jacobi.aabeo" 2> "stderr.aabeo"
fi

# launch job for aabep
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabep.slurm"
else
    sh "./sbatch.aabep.slurm" > "jacobi.aabep" 2> "stderr.aabep"
fi

# launch job for aabeq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabeq.slurm"
else
    sh "./sbatch.aabeq.slurm" > "jacobi.aabeq" 2> "stderr.aabeq"
fi

# launch job for aaber
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aaber.slurm"
else
    sh "./sbatch.aaber.slurm" > "jacobi.aaber" 2> "stderr.aaber"
fi

# launch job for aabes
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabes.slurm"
else
    sh "./sbatch.aabes.slurm" > "jacobi.aabes" 2> "stderr.aabes"
fi

# launch job for aabet
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabet.slurm"
else
    sh "./sbatch.aabet.slurm" > "jacobi.aabet" 2> "stderr.aabet"
fi

# launch job for aabeu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabeu.slurm"
else
    sh "./sbatch.aabeu.slurm" > "jacobi.aabeu" 2> "stderr.aabeu"
fi

# launch job for aabev
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabev.slurm"
else
    sh "./sbatch.aabev.slurm" > "jacobi.aabev" 2> "stderr.aabev"
fi

# launch job for aabew
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabew.slurm"
else
    sh "./sbatch.aabew.slurm" > "jacobi.aabew" 2> "stderr.aabew"
fi

# launch job for aabex
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabex.slurm"
else
    sh "./sbatch.aabex.slurm" > "jacobi.aabex" 2> "stderr.aabex"
fi

# launch job for aabey
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabey.slurm"
else
    sh "./sbatch.aabey.slurm" > "jacobi.aabey" 2> "stderr.aabey"
fi

# launch job for aabez
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabez.slurm"
else
    sh "./sbatch.aabez.slurm" > "jacobi.aabez" 2> "stderr.aabez"
fi

# launch job for aabfa
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfa.slurm"
else
    sh "./sbatch.aabfa.slurm" > "jacobi.aabfa" 2> "stderr.aabfa"
fi

# launch job for aabfb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfb.slurm"
else
    sh "./sbatch.aabfb.slurm" > "jacobi.aabfb" 2> "stderr.aabfb"
fi

# launch job for aabfc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfc.slurm"
else
    sh "./sbatch.aabfc.slurm" > "jacobi.aabfc" 2> "stderr.aabfc"
fi

# launch job for aabfd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfd.slurm"
else
    sh "./sbatch.aabfd.slurm" > "jacobi.aabfd" 2> "stderr.aabfd"
fi

# launch job for aabfe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfe.slurm"
else
    sh "./sbatch.aabfe.slurm" > "jacobi.aabfe" 2> "stderr.aabfe"
fi

# launch job for aabff
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabff.slurm"
else
    sh "./sbatch.aabff.slurm" > "jacobi.aabff" 2> "stderr.aabff"
fi

# launch job for aabfg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfg.slurm"
else
    sh "./sbatch.aabfg.slurm" > "jacobi.aabfg" 2> "stderr.aabfg"
fi

# launch job for aabfh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfh.slurm"
else
    sh "./sbatch.aabfh.slurm" > "jacobi.aabfh" 2> "stderr.aabfh"
fi

# launch job for aabfi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfi.slurm"
else
    sh "./sbatch.aabfi.slurm" > "jacobi.aabfi" 2> "stderr.aabfi"
fi

# launch job for aabfj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfj.slurm"
else
    sh "./sbatch.aabfj.slurm" > "jacobi.aabfj" 2> "stderr.aabfj"
fi

# launch job for aabfk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfk.slurm"
else
    sh "./sbatch.aabfk.slurm" > "jacobi.aabfk" 2> "stderr.aabfk"
fi

# launch job for aabfl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfl.slurm"
else
    sh "./sbatch.aabfl.slurm" > "jacobi.aabfl" 2> "stderr.aabfl"
fi

# launch job for aabfm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfm.slurm"
else
    sh "./sbatch.aabfm.slurm" > "jacobi.aabfm" 2> "stderr.aabfm"
fi

# launch job for aabfn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfn.slurm"
else
    sh "./sbatch.aabfn.slurm" > "jacobi.aabfn" 2> "stderr.aabfn"
fi

# launch job for aabfo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfo.slurm"
else
    sh "./sbatch.aabfo.slurm" > "jacobi.aabfo" 2> "stderr.aabfo"
fi

# launch job for aabfp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfp.slurm"
else
    sh "./sbatch.aabfp.slurm" > "jacobi.aabfp" 2> "stderr.aabfp"
fi

# launch job for aabfq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfq.slurm"
else
    sh "./sbatch.aabfq.slurm" > "jacobi.aabfq" 2> "stderr.aabfq"
fi

# launch job for aabfr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfr.slurm"
else
    sh "./sbatch.aabfr.slurm" > "jacobi.aabfr" 2> "stderr.aabfr"
fi

# launch job for aabfs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfs.slurm"
else
    sh "./sbatch.aabfs.slurm" > "jacobi.aabfs" 2> "stderr.aabfs"
fi

# launch job for aabft
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabft.slurm"
else
    sh "./sbatch.aabft.slurm" > "jacobi.aabft" 2> "stderr.aabft"
fi

# launch job for aabfu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfu.slurm"
else
    sh "./sbatch.aabfu.slurm" > "jacobi.aabfu" 2> "stderr.aabfu"
fi

# launch job for aabfv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfv.slurm"
else
    sh "./sbatch.aabfv.slurm" > "jacobi.aabfv" 2> "stderr.aabfv"
fi

# launch job for aabfw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfw.slurm"
else
    sh "./sbatch.aabfw.slurm" > "jacobi.aabfw" 2> "stderr.aabfw"
fi

# launch job for aabfx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfx.slurm"
else
    sh "./sbatch.aabfx.slurm" > "jacobi.aabfx" 2> "stderr.aabfx"
fi

# launch job for aabfy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfy.slurm"
else
    sh "./sbatch.aabfy.slurm" > "jacobi.aabfy" 2> "stderr.aabfy"
fi

# launch job for aabfz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabfz.slurm"
else
    sh "./sbatch.aabfz.slurm" > "jacobi.aabfz" 2> "stderr.aabfz"
fi

# launch job for aabga
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabga.slurm"
else
    sh "./sbatch.aabga.slurm" > "jacobi.aabga" 2> "stderr.aabga"
fi

# launch job for aabgb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgb.slurm"
else
    sh "./sbatch.aabgb.slurm" > "jacobi.aabgb" 2> "stderr.aabgb"
fi

# launch job for aabgc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgc.slurm"
else
    sh "./sbatch.aabgc.slurm" > "jacobi.aabgc" 2> "stderr.aabgc"
fi

# launch job for aabgd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgd.slurm"
else
    sh "./sbatch.aabgd.slurm" > "jacobi.aabgd" 2> "stderr.aabgd"
fi

# launch job for aabge
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabge.slurm"
else
    sh "./sbatch.aabge.slurm" > "jacobi.aabge" 2> "stderr.aabge"
fi

# launch job for aabgf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgf.slurm"
else
    sh "./sbatch.aabgf.slurm" > "jacobi.aabgf" 2> "stderr.aabgf"
fi

# launch job for aabgg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgg.slurm"
else
    sh "./sbatch.aabgg.slurm" > "jacobi.aabgg" 2> "stderr.aabgg"
fi

# launch job for aabgh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgh.slurm"
else
    sh "./sbatch.aabgh.slurm" > "jacobi.aabgh" 2> "stderr.aabgh"
fi

# launch job for aabgi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgi.slurm"
else
    sh "./sbatch.aabgi.slurm" > "jacobi.aabgi" 2> "stderr.aabgi"
fi

# launch job for aabgj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgj.slurm"
else
    sh "./sbatch.aabgj.slurm" > "jacobi.aabgj" 2> "stderr.aabgj"
fi

# launch job for aabgk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgk.slurm"
else
    sh "./sbatch.aabgk.slurm" > "jacobi.aabgk" 2> "stderr.aabgk"
fi

# launch job for aabgl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgl.slurm"
else
    sh "./sbatch.aabgl.slurm" > "jacobi.aabgl" 2> "stderr.aabgl"
fi

# launch job for aabgm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgm.slurm"
else
    sh "./sbatch.aabgm.slurm" > "jacobi.aabgm" 2> "stderr.aabgm"
fi

# launch job for aabgn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgn.slurm"
else
    sh "./sbatch.aabgn.slurm" > "jacobi.aabgn" 2> "stderr.aabgn"
fi

# launch job for aabgo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgo.slurm"
else
    sh "./sbatch.aabgo.slurm" > "jacobi.aabgo" 2> "stderr.aabgo"
fi

# launch job for aabgp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgp.slurm"
else
    sh "./sbatch.aabgp.slurm" > "jacobi.aabgp" 2> "stderr.aabgp"
fi

# launch job for aabgq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgq.slurm"
else
    sh "./sbatch.aabgq.slurm" > "jacobi.aabgq" 2> "stderr.aabgq"
fi

# launch job for aabgr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgr.slurm"
else
    sh "./sbatch.aabgr.slurm" > "jacobi.aabgr" 2> "stderr.aabgr"
fi

# launch job for aabgs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgs.slurm"
else
    sh "./sbatch.aabgs.slurm" > "jacobi.aabgs" 2> "stderr.aabgs"
fi

# launch job for aabgt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgt.slurm"
else
    sh "./sbatch.aabgt.slurm" > "jacobi.aabgt" 2> "stderr.aabgt"
fi

# launch job for aabgu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgu.slurm"
else
    sh "./sbatch.aabgu.slurm" > "jacobi.aabgu" 2> "stderr.aabgu"
fi

# launch job for aabgv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgv.slurm"
else
    sh "./sbatch.aabgv.slurm" > "jacobi.aabgv" 2> "stderr.aabgv"
fi

# launch job for aabgw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgw.slurm"
else
    sh "./sbatch.aabgw.slurm" > "jacobi.aabgw" 2> "stderr.aabgw"
fi

# launch job for aabgx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgx.slurm"
else
    sh "./sbatch.aabgx.slurm" > "jacobi.aabgx" 2> "stderr.aabgx"
fi

# launch job for aabgy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgy.slurm"
else
    sh "./sbatch.aabgy.slurm" > "jacobi.aabgy" 2> "stderr.aabgy"
fi

# launch job for aabgz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabgz.slurm"
else
    sh "./sbatch.aabgz.slurm" > "jacobi.aabgz" 2> "stderr.aabgz"
fi

# launch job for aabha
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabha.slurm"
else
    sh "./sbatch.aabha.slurm" > "jacobi.aabha" 2> "stderr.aabha"
fi

# launch job for aabhb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhb.slurm"
else
    sh "./sbatch.aabhb.slurm" > "jacobi.aabhb" 2> "stderr.aabhb"
fi

# launch job for aabhc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhc.slurm"
else
    sh "./sbatch.aabhc.slurm" > "jacobi.aabhc" 2> "stderr.aabhc"
fi

# launch job for aabhd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhd.slurm"
else
    sh "./sbatch.aabhd.slurm" > "jacobi.aabhd" 2> "stderr.aabhd"
fi

# launch job for aabhe
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhe.slurm"
else
    sh "./sbatch.aabhe.slurm" > "jacobi.aabhe" 2> "stderr.aabhe"
fi

# launch job for aabhf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhf.slurm"
else
    sh "./sbatch.aabhf.slurm" > "jacobi.aabhf" 2> "stderr.aabhf"
fi

# launch job for aabhg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhg.slurm"
else
    sh "./sbatch.aabhg.slurm" > "jacobi.aabhg" 2> "stderr.aabhg"
fi

# launch job for aabhh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhh.slurm"
else
    sh "./sbatch.aabhh.slurm" > "jacobi.aabhh" 2> "stderr.aabhh"
fi

# launch job for aabhi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhi.slurm"
else
    sh "./sbatch.aabhi.slurm" > "jacobi.aabhi" 2> "stderr.aabhi"
fi

# launch job for aabhj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhj.slurm"
else
    sh "./sbatch.aabhj.slurm" > "jacobi.aabhj" 2> "stderr.aabhj"
fi

# launch job for aabhk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhk.slurm"
else
    sh "./sbatch.aabhk.slurm" > "jacobi.aabhk" 2> "stderr.aabhk"
fi

# launch job for aabhl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhl.slurm"
else
    sh "./sbatch.aabhl.slurm" > "jacobi.aabhl" 2> "stderr.aabhl"
fi

# launch job for aabhm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhm.slurm"
else
    sh "./sbatch.aabhm.slurm" > "jacobi.aabhm" 2> "stderr.aabhm"
fi

# launch job for aabhn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhn.slurm"
else
    sh "./sbatch.aabhn.slurm" > "jacobi.aabhn" 2> "stderr.aabhn"
fi

# launch job for aabho
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabho.slurm"
else
    sh "./sbatch.aabho.slurm" > "jacobi.aabho" 2> "stderr.aabho"
fi

# launch job for aabhp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhp.slurm"
else
    sh "./sbatch.aabhp.slurm" > "jacobi.aabhp" 2> "stderr.aabhp"
fi

# launch job for aabhq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhq.slurm"
else
    sh "./sbatch.aabhq.slurm" > "jacobi.aabhq" 2> "stderr.aabhq"
fi

# launch job for aabhr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhr.slurm"
else
    sh "./sbatch.aabhr.slurm" > "jacobi.aabhr" 2> "stderr.aabhr"
fi

# launch job for aabhs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhs.slurm"
else
    sh "./sbatch.aabhs.slurm" > "jacobi.aabhs" 2> "stderr.aabhs"
fi

# launch job for aabht
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabht.slurm"
else
    sh "./sbatch.aabht.slurm" > "jacobi.aabht" 2> "stderr.aabht"
fi

# launch job for aabhu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhu.slurm"
else
    sh "./sbatch.aabhu.slurm" > "jacobi.aabhu" 2> "stderr.aabhu"
fi

# launch job for aabhv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhv.slurm"
else
    sh "./sbatch.aabhv.slurm" > "jacobi.aabhv" 2> "stderr.aabhv"
fi

# launch job for aabhw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhw.slurm"
else
    sh "./sbatch.aabhw.slurm" > "jacobi.aabhw" 2> "stderr.aabhw"
fi

# launch job for aabhx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhx.slurm"
else
    sh "./sbatch.aabhx.slurm" > "jacobi.aabhx" 2> "stderr.aabhx"
fi

# launch job for aabhy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhy.slurm"
else
    sh "./sbatch.aabhy.slurm" > "jacobi.aabhy" 2> "stderr.aabhy"
fi

# launch job for aabhz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabhz.slurm"
else
    sh "./sbatch.aabhz.slurm" > "jacobi.aabhz" 2> "stderr.aabhz"
fi

# launch job for aabia
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabia.slurm"
else
    sh "./sbatch.aabia.slurm" > "jacobi.aabia" 2> "stderr.aabia"
fi

# launch job for aabib
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabib.slurm"
else
    sh "./sbatch.aabib.slurm" > "jacobi.aabib" 2> "stderr.aabib"
fi

# launch job for aabic
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabic.slurm"
else
    sh "./sbatch.aabic.slurm" > "jacobi.aabic" 2> "stderr.aabic"
fi

# launch job for aabid
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabid.slurm"
else
    sh "./sbatch.aabid.slurm" > "jacobi.aabid" 2> "stderr.aabid"
fi

# launch job for aabie
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabie.slurm"
else
    sh "./sbatch.aabie.slurm" > "jacobi.aabie" 2> "stderr.aabie"
fi

# launch job for aabif
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabif.slurm"
else
    sh "./sbatch.aabif.slurm" > "jacobi.aabif" 2> "stderr.aabif"
fi

# launch job for aabig
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabig.slurm"
else
    sh "./sbatch.aabig.slurm" > "jacobi.aabig" 2> "stderr.aabig"
fi

# launch job for aabih
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabih.slurm"
else
    sh "./sbatch.aabih.slurm" > "jacobi.aabih" 2> "stderr.aabih"
fi

# launch job for aabii
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabii.slurm"
else
    sh "./sbatch.aabii.slurm" > "jacobi.aabii" 2> "stderr.aabii"
fi

# launch job for aabij
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabij.slurm"
else
    sh "./sbatch.aabij.slurm" > "jacobi.aabij" 2> "stderr.aabij"
fi

# launch job for aabik
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabik.slurm"
else
    sh "./sbatch.aabik.slurm" > "jacobi.aabik" 2> "stderr.aabik"
fi

# launch job for aabil
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabil.slurm"
else
    sh "./sbatch.aabil.slurm" > "jacobi.aabil" 2> "stderr.aabil"
fi

# launch job for aabim
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabim.slurm"
else
    sh "./sbatch.aabim.slurm" > "jacobi.aabim" 2> "stderr.aabim"
fi

# launch job for aabin
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabin.slurm"
else
    sh "./sbatch.aabin.slurm" > "jacobi.aabin" 2> "stderr.aabin"
fi

# launch job for aabio
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabio.slurm"
else
    sh "./sbatch.aabio.slurm" > "jacobi.aabio" 2> "stderr.aabio"
fi

# launch job for aabip
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabip.slurm"
else
    sh "./sbatch.aabip.slurm" > "jacobi.aabip" 2> "stderr.aabip"
fi

# launch job for aabiq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabiq.slurm"
else
    sh "./sbatch.aabiq.slurm" > "jacobi.aabiq" 2> "stderr.aabiq"
fi

# launch job for aabir
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabir.slurm"
else
    sh "./sbatch.aabir.slurm" > "jacobi.aabir" 2> "stderr.aabir"
fi

# launch job for aabis
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabis.slurm"
else
    sh "./sbatch.aabis.slurm" > "jacobi.aabis" 2> "stderr.aabis"
fi

# launch job for aabit
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabit.slurm"
else
    sh "./sbatch.aabit.slurm" > "jacobi.aabit" 2> "stderr.aabit"
fi

# launch job for aabiu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabiu.slurm"
else
    sh "./sbatch.aabiu.slurm" > "jacobi.aabiu" 2> "stderr.aabiu"
fi

# launch job for aabiv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabiv.slurm"
else
    sh "./sbatch.aabiv.slurm" > "jacobi.aabiv" 2> "stderr.aabiv"
fi

# launch job for aabiw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabiw.slurm"
else
    sh "./sbatch.aabiw.slurm" > "jacobi.aabiw" 2> "stderr.aabiw"
fi

# launch job for aabix
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabix.slurm"
else
    sh "./sbatch.aabix.slurm" > "jacobi.aabix" 2> "stderr.aabix"
fi

# launch job for aabiy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabiy.slurm"
else
    sh "./sbatch.aabiy.slurm" > "jacobi.aabiy" 2> "stderr.aabiy"
fi

# launch job for aabiz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabiz.slurm"
else
    sh "./sbatch.aabiz.slurm" > "jacobi.aabiz" 2> "stderr.aabiz"
fi

# launch job for aabja
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabja.slurm"
else
    sh "./sbatch.aabja.slurm" > "jacobi.aabja" 2> "stderr.aabja"
fi

# launch job for aabjb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjb.slurm"
else
    sh "./sbatch.aabjb.slurm" > "jacobi.aabjb" 2> "stderr.aabjb"
fi

# launch job for aabjc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjc.slurm"
else
    sh "./sbatch.aabjc.slurm" > "jacobi.aabjc" 2> "stderr.aabjc"
fi

# launch job for aabjd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjd.slurm"
else
    sh "./sbatch.aabjd.slurm" > "jacobi.aabjd" 2> "stderr.aabjd"
fi

# launch job for aabje
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabje.slurm"
else
    sh "./sbatch.aabje.slurm" > "jacobi.aabje" 2> "stderr.aabje"
fi

# launch job for aabjf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjf.slurm"
else
    sh "./sbatch.aabjf.slurm" > "jacobi.aabjf" 2> "stderr.aabjf"
fi

# launch job for aabjg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjg.slurm"
else
    sh "./sbatch.aabjg.slurm" > "jacobi.aabjg" 2> "stderr.aabjg"
fi

# launch job for aabjh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjh.slurm"
else
    sh "./sbatch.aabjh.slurm" > "jacobi.aabjh" 2> "stderr.aabjh"
fi

# launch job for aabji
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabji.slurm"
else
    sh "./sbatch.aabji.slurm" > "jacobi.aabji" 2> "stderr.aabji"
fi

# launch job for aabjj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjj.slurm"
else
    sh "./sbatch.aabjj.slurm" > "jacobi.aabjj" 2> "stderr.aabjj"
fi

# launch job for aabjk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjk.slurm"
else
    sh "./sbatch.aabjk.slurm" > "jacobi.aabjk" 2> "stderr.aabjk"
fi

# launch job for aabjl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjl.slurm"
else
    sh "./sbatch.aabjl.slurm" > "jacobi.aabjl" 2> "stderr.aabjl"
fi

# launch job for aabjm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjm.slurm"
else
    sh "./sbatch.aabjm.slurm" > "jacobi.aabjm" 2> "stderr.aabjm"
fi

# launch job for aabjn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjn.slurm"
else
    sh "./sbatch.aabjn.slurm" > "jacobi.aabjn" 2> "stderr.aabjn"
fi

# launch job for aabjo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjo.slurm"
else
    sh "./sbatch.aabjo.slurm" > "jacobi.aabjo" 2> "stderr.aabjo"
fi

# launch job for aabjp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjp.slurm"
else
    sh "./sbatch.aabjp.slurm" > "jacobi.aabjp" 2> "stderr.aabjp"
fi

# launch job for aabjq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjq.slurm"
else
    sh "./sbatch.aabjq.slurm" > "jacobi.aabjq" 2> "stderr.aabjq"
fi

# launch job for aabjr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjr.slurm"
else
    sh "./sbatch.aabjr.slurm" > "jacobi.aabjr" 2> "stderr.aabjr"
fi

# launch job for aabjs
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjs.slurm"
else
    sh "./sbatch.aabjs.slurm" > "jacobi.aabjs" 2> "stderr.aabjs"
fi

# launch job for aabjt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjt.slurm"
else
    sh "./sbatch.aabjt.slurm" > "jacobi.aabjt" 2> "stderr.aabjt"
fi

# launch job for aabju
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabju.slurm"
else
    sh "./sbatch.aabju.slurm" > "jacobi.aabju" 2> "stderr.aabju"
fi

# launch job for aabjv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjv.slurm"
else
    sh "./sbatch.aabjv.slurm" > "jacobi.aabjv" 2> "stderr.aabjv"
fi

# launch job for aabjw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjw.slurm"
else
    sh "./sbatch.aabjw.slurm" > "jacobi.aabjw" 2> "stderr.aabjw"
fi

# launch job for aabjx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjx.slurm"
else
    sh "./sbatch.aabjx.slurm" > "jacobi.aabjx" 2> "stderr.aabjx"
fi

# launch job for aabjy
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjy.slurm"
else
    sh "./sbatch.aabjy.slurm" > "jacobi.aabjy" 2> "stderr.aabjy"
fi

# launch job for aabjz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabjz.slurm"
else
    sh "./sbatch.aabjz.slurm" > "jacobi.aabjz" 2> "stderr.aabjz"
fi

# launch job for aabka
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabka.slurm"
else
    sh "./sbatch.aabka.slurm" > "jacobi.aabka" 2> "stderr.aabka"
fi

# launch job for aabkb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkb.slurm"
else
    sh "./sbatch.aabkb.slurm" > "jacobi.aabkb" 2> "stderr.aabkb"
fi

# launch job for aabkc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkc.slurm"
else
    sh "./sbatch.aabkc.slurm" > "jacobi.aabkc" 2> "stderr.aabkc"
fi

# launch job for aabkd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkd.slurm"
else
    sh "./sbatch.aabkd.slurm" > "jacobi.aabkd" 2> "stderr.aabkd"
fi

# launch job for aabke
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabke.slurm"
else
    sh "./sbatch.aabke.slurm" > "jacobi.aabke" 2> "stderr.aabke"
fi

# launch job for aabkf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkf.slurm"
else
    sh "./sbatch.aabkf.slurm" > "jacobi.aabkf" 2> "stderr.aabkf"
fi

# launch job for aabkg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkg.slurm"
else
    sh "./sbatch.aabkg.slurm" > "jacobi.aabkg" 2> "stderr.aabkg"
fi

# launch job for aabkh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkh.slurm"
else
    sh "./sbatch.aabkh.slurm" > "jacobi.aabkh" 2> "stderr.aabkh"
fi

# launch job for aabki
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabki.slurm"
else
    sh "./sbatch.aabki.slurm" > "jacobi.aabki" 2> "stderr.aabki"
fi

# launch job for aabkj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkj.slurm"
else
    sh "./sbatch.aabkj.slurm" > "jacobi.aabkj" 2> "stderr.aabkj"
fi

# launch job for aabkk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkk.slurm"
else
    sh "./sbatch.aabkk.slurm" > "jacobi.aabkk" 2> "stderr.aabkk"
fi

# launch job for aabkl
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkl.slurm"
else
    sh "./sbatch.aabkl.slurm" > "jacobi.aabkl" 2> "stderr.aabkl"
fi

# launch job for aabkm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkm.slurm"
else
    sh "./sbatch.aabkm.slurm" > "jacobi.aabkm" 2> "stderr.aabkm"
fi

# launch job for aabkn
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkn.slurm"
else
    sh "./sbatch.aabkn.slurm" > "jacobi.aabkn" 2> "stderr.aabkn"
fi

# launch job for aabko
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabko.slurm"
else
    sh "./sbatch.aabko.slurm" > "jacobi.aabko" 2> "stderr.aabko"
fi

# launch job for aabkp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkp.slurm"
else
    sh "./sbatch.aabkp.slurm" > "jacobi.aabkp" 2> "stderr.aabkp"
fi

# launch job for aabkq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkq.slurm"
else
    sh "./sbatch.aabkq.slurm" > "jacobi.aabkq" 2> "stderr.aabkq"
fi

# launch job for aabkr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkr.slurm"
else
    sh "./sbatch.aabkr.slurm" > "jacobi.aabkr" 2> "stderr.aabkr"
fi

# launch job for aabks
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabks.slurm"
else
    sh "./sbatch.aabks.slurm" > "jacobi.aabks" 2> "stderr.aabks"
fi

# launch job for aabkt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkt.slurm"
else
    sh "./sbatch.aabkt.slurm" > "jacobi.aabkt" 2> "stderr.aabkt"
fi

# launch job for aabku
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabku.slurm"
else
    sh "./sbatch.aabku.slurm" > "jacobi.aabku" 2> "stderr.aabku"
fi

# launch job for aabkv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkv.slurm"
else
    sh "./sbatch.aabkv.slurm" > "jacobi.aabkv" 2> "stderr.aabkv"
fi

# launch job for aabkw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkw.slurm"
else
    sh "./sbatch.aabkw.slurm" > "jacobi.aabkw" 2> "stderr.aabkw"
fi

# launch job for aabkx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkx.slurm"
else
    sh "./sbatch.aabkx.slurm" > "jacobi.aabkx" 2> "stderr.aabkx"
fi

# launch job for aabky
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabky.slurm"
else
    sh "./sbatch.aabky.slurm" > "jacobi.aabky" 2> "stderr.aabky"
fi

# launch job for aabkz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabkz.slurm"
else
    sh "./sbatch.aabkz.slurm" > "jacobi.aabkz" 2> "stderr.aabkz"
fi

# launch job for aabla
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabla.slurm"
else
    sh "./sbatch.aabla.slurm" > "jacobi.aabla" 2> "stderr.aabla"
fi

# launch job for aablb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablb.slurm"
else
    sh "./sbatch.aablb.slurm" > "jacobi.aablb" 2> "stderr.aablb"
fi

# launch job for aablc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablc.slurm"
else
    sh "./sbatch.aablc.slurm" > "jacobi.aablc" 2> "stderr.aablc"
fi

# launch job for aabld
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabld.slurm"
else
    sh "./sbatch.aabld.slurm" > "jacobi.aabld" 2> "stderr.aabld"
fi

# launch job for aable
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aable.slurm"
else
    sh "./sbatch.aable.slurm" > "jacobi.aable" 2> "stderr.aable"
fi

# launch job for aablf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablf.slurm"
else
    sh "./sbatch.aablf.slurm" > "jacobi.aablf" 2> "stderr.aablf"
fi

# launch job for aablg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablg.slurm"
else
    sh "./sbatch.aablg.slurm" > "jacobi.aablg" 2> "stderr.aablg"
fi

# launch job for aablh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablh.slurm"
else
    sh "./sbatch.aablh.slurm" > "jacobi.aablh" 2> "stderr.aablh"
fi

# launch job for aabli
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabli.slurm"
else
    sh "./sbatch.aabli.slurm" > "jacobi.aabli" 2> "stderr.aabli"
fi

# launch job for aablj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablj.slurm"
else
    sh "./sbatch.aablj.slurm" > "jacobi.aablj" 2> "stderr.aablj"
fi

# launch job for aablk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablk.slurm"
else
    sh "./sbatch.aablk.slurm" > "jacobi.aablk" 2> "stderr.aablk"
fi

# launch job for aabll
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabll.slurm"
else
    sh "./sbatch.aabll.slurm" > "jacobi.aabll" 2> "stderr.aabll"
fi

# launch job for aablm
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablm.slurm"
else
    sh "./sbatch.aablm.slurm" > "jacobi.aablm" 2> "stderr.aablm"
fi

# launch job for aabln
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabln.slurm"
else
    sh "./sbatch.aabln.slurm" > "jacobi.aabln" 2> "stderr.aabln"
fi

# launch job for aablo
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablo.slurm"
else
    sh "./sbatch.aablo.slurm" > "jacobi.aablo" 2> "stderr.aablo"
fi

# launch job for aablp
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablp.slurm"
else
    sh "./sbatch.aablp.slurm" > "jacobi.aablp" 2> "stderr.aablp"
fi

# launch job for aablq
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablq.slurm"
else
    sh "./sbatch.aablq.slurm" > "jacobi.aablq" 2> "stderr.aablq"
fi

# launch job for aablr
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablr.slurm"
else
    sh "./sbatch.aablr.slurm" > "jacobi.aablr" 2> "stderr.aablr"
fi

# launch job for aabls
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabls.slurm"
else
    sh "./sbatch.aabls.slurm" > "jacobi.aabls" 2> "stderr.aabls"
fi

# launch job for aablt
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablt.slurm"
else
    sh "./sbatch.aablt.slurm" > "jacobi.aablt" 2> "stderr.aablt"
fi

# launch job for aablu
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablu.slurm"
else
    sh "./sbatch.aablu.slurm" > "jacobi.aablu" 2> "stderr.aablu"
fi

# launch job for aablv
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablv.slurm"
else
    sh "./sbatch.aablv.slurm" > "jacobi.aablv" 2> "stderr.aablv"
fi

# launch job for aablw
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablw.slurm"
else
    sh "./sbatch.aablw.slurm" > "jacobi.aablw" 2> "stderr.aablw"
fi

# launch job for aablx
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablx.slurm"
else
    sh "./sbatch.aablx.slurm" > "jacobi.aablx" 2> "stderr.aablx"
fi

# launch job for aably
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aably.slurm"
else
    sh "./sbatch.aably.slurm" > "jacobi.aably" 2> "stderr.aably"
fi

# launch job for aablz
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aablz.slurm"
else
    sh "./sbatch.aablz.slurm" > "jacobi.aablz" 2> "stderr.aablz"
fi

# launch job for aabma
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabma.slurm"
else
    sh "./sbatch.aabma.slurm" > "jacobi.aabma" 2> "stderr.aabma"
fi

# launch job for aabmb
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmb.slurm"
else
    sh "./sbatch.aabmb.slurm" > "jacobi.aabmb" 2> "stderr.aabmb"
fi

# launch job for aabmc
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmc.slurm"
else
    sh "./sbatch.aabmc.slurm" > "jacobi.aabmc" 2> "stderr.aabmc"
fi

# launch job for aabmd
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmd.slurm"
else
    sh "./sbatch.aabmd.slurm" > "jacobi.aabmd" 2> "stderr.aabmd"
fi

# launch job for aabme
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabme.slurm"
else
    sh "./sbatch.aabme.slurm" > "jacobi.aabme" 2> "stderr.aabme"
fi

# launch job for aabmf
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmf.slurm"
else
    sh "./sbatch.aabmf.slurm" > "jacobi.aabmf" 2> "stderr.aabmf"
fi

# launch job for aabmg
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmg.slurm"
else
    sh "./sbatch.aabmg.slurm" > "jacobi.aabmg" 2> "stderr.aabmg"
fi

# launch job for aabmh
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmh.slurm"
else
    sh "./sbatch.aabmh.slurm" > "jacobi.aabmh" 2> "stderr.aabmh"
fi

# launch job for aabmi
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmi.slurm"
else
    sh "./sbatch.aabmi.slurm" > "jacobi.aabmi" 2> "stderr.aabmi"
fi

# launch job for aabmj
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmj.slurm"
else
    sh "./sbatch.aabmj.slurm" > "jacobi.aabmj" 2> "stderr.aabmj"
fi

# launch job for aabmk
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabmk.slurm"
else
    sh "./sbatch.aabmk.slurm" > "jacobi.aabmk" 2> "stderr.aabmk"
fi

# launch job for aabml
#
if [[ -n $SBATCH ]]; then
    "$SBATCH" "sbatch.aabml.slurm"
else
    sh "./sbatch.aabml.slurm" > "jacobi.aabml" 2> "stderr.aabml"
fi

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
