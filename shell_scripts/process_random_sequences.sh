#!/bin/bash
COUNTER=1
TPATH=/home/shared/L1-Alu/shuffle/fasta/
for filename in $(ls $TPATH | shuf); do
    tail -n1 $TPATH$filename >> /home/alexshein/last_n_bps/random_nt_seq.txt
    COUNTER=$[COUNTER + 1]
    if (($(($COUNTER%100)) == 0))
    then
        echo -ne "\r#Processing $COUNTER out of $LEN"
    fi
    if [[ COUNTER == 12000 ]]
    then
        echo -ne "\r#Done, processed $COUNTER files\n"
        break
    fi
done;