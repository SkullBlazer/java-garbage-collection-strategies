#!/bin/bash

DUT=avaneesh@10.42.0.1   # your laptop IP
RUN=1

for SUBJECT in DaCapo CLBG-BinaryTrees CLBG-Fannkuch CLBG-NBody Rosetta PetClinic TodoApp ANDIE; do
  for GC in Serial Parallel G1; do
    for WORKLOAD in Light Medium Heavy; do
      for JDK in openjdk oracle; do
        for REP in 1 2 3 4; do

          echo "=== RUN $RUN: $SUBJECT $GC $WORKLOAD $JDK rep $REP ==="

          ssh $DUT "bash ~/experiment/run_single_experiment.sh \
            $SUBJECT $GC $WORKLOAD $JDK repetition_$REP $RUN"

          ((RUN++))
          sleep 5
        done
      done
    done
  done
done

