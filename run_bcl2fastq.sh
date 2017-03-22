#!/usr/bin/env bash

runfolder="/run"

bcl2fastq \
    --ignore-missing-bcls \
    --ignore-missing-filter \
    --ignore-missing-positions \
    --ignore-missing-controls \
    --barcode-mismatches 1 \
    --loading-threads 4 \
    --processing-threads 8 \
    --writing-threads 4 \
    --sample-sheet "${runfolder}/SampleSheet.csv" \
    -R "${runfolder}" \
    -o "${runfolder}/Analysis/Fastqs" \
    -i "${runfolder}/Data/Intensities/BaseCalls"

