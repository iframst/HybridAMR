#!/bin/sh

#  Nano-polish-pipeline.sh
#  
#
#  Created by Isaac Framst on 2021-10-11.
## Isaac Framst
## University of Guelph, OVC Pathobiology
## University of Georgia, Pathology Department
## Supervisor: Dr. Grazieli Maboni

## updated September 28, 2021 by Isaac Framst (iframst@uoguelph.ca)
## Bioinformatics pipleline for nanopore assembly polished with Illumina reads for AMR Sequencing Project (UGA - Dr. Grazieli Maboni)

echo "Please assign run ID"
read runID
echo "please specify path to nanopore assembly"
read nanoAssm
echo "please specify path to Illumina R1"
read R1
echo "please specify path to Illumona R2"
read R2

printf "\n\n*******************************************************************************\n"
printf "Run started for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"


#create working dirs
mkdir ${runID}
cd ${runID}
cp ${nanoAssm} assm_in.fasta

bwa index assm_in.fasta
bwa mem assm_in.fasta ${R1} ${R2} > bwa_map.sam

samtools view -b bwa_map.sam > bwa_map.bam
samtools sort bwa_map.bam > bwa_map_sorted.bam
samtools index bwa_map_sorted.bam

pilon --genome assm_in.fasta --bam bwa_map_sorted.bam --threads 8 --outdir ${runID} --output ${runID}_pilon

printf "\n\n*******************************************************************************\n"
printf "Run finished for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"
