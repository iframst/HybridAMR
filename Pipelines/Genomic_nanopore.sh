## Isaac Framst
## University of Guelph, OVC Pathobiology
## University of Georgia, Pathology department
## Supervisor: Dr. Grazieli Maboni
## september 23 2021

## updated May 25, 2022 by Isaac Framst (iframst@uoguelph.ca)


## Bioinformatics pipleline for nanopore only reads AMR Sequencing Project (UGA - Dr. Grazieli Maboni)

## User input for assigning a sample ID to the barcoded output from minKNOW


#*************************************************
echo "please assign run ID"
read runID
echo "please specify directory for raw reads"
read readDir

printf "\n\n*******************************************************************************\n"
printf "Run started for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"

## working dirs
mkdir trimmed
mkdir assembled_raw
mkdir assembled_polished
mkdir temp
mkdir ${runID}_out

## join all reads in one file, store in temp location
cat ${readDir}/*.fastq > temp/${runID}_all.fastq

## trim adapters and barcodes
porechop -i temp/${runID}_all.fastq -o trimmed/${runID}_trimmed.fastq --threads 8 --barcode_threshold 80

## Assemble
flye --nano-raw trimmed/${runID}_trimmed.fastq --out-dir assembled_raw/${runID}_assm_raw --threads 4 -i 2 --asm-coverage 100 --genome-size 100k


minimap2 -x map-ont --secondary=no -t 8 assembled_raw/${runID}_assm_raw/assembly.fasta trimmed/${runID}_trimmed.fastq > temp/Polish_ONT.paf

## Polish
racon trimmed/${runID}_trimmed.fastq temp/Polish_ONT.paf assembled_raw/${runID}_assm_raw/assembly.fasta -t 8 > ${runID}_out/${runID}_polished.fasta

##cleanup temp files and extra data (careful with this one)
rm -r temp
rm -r trimmed
rm -r assembled_raw
rm -r assembled_polished
printf "\n\n*******************************************************************************\n"
printf "Run finished for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"

## Validated May 30 2022
## EOF
