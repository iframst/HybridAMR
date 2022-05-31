## Isaac Framst
## University of Guelph, OVC Pathobiology
## University of Georgia, Pathology department
## Supervisor: Dr. Grazieli Maboni

## updated May 25, 2022 by Isaac Framst (iframst@uoguelph.ca)


## Bioinformatics pipleline for nanopore only reads AMR Sequencing Project (UGA - Dr. Grazieli Maboni)
## User input for assigning a sample ID to the barcoded output from minKNOW


#*************************************************
echo "please assign run ID"
read runID
echo "please specify directory for raw ONT reads"
read readDir
echo "Please specify directory for illumina forward reads"
read fwdRead
echo "Please specify directory for illumina reverse reads"
read revRead

printf "\n\n*******************************************************************************\n"
printf "Run started for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"

## working dirs
mkdir $runID
cd $runID

## join all reads in one file, store in temp location
cat ${readDir}/*.fastq > ${runID}_all.fastq

## trim adapters and barcodes
porechop -i ${runID}_all.fastq -o ${runID}_trimmed.fastq --threads 10 --barcode_threshold 80

## Assemble
flye --nano-raw ${runID}_trimmed.fastq --out-dir ${runID}_assm_raw --threads 4 -i 2 

## Polish
bwa index ${runID}_assm_raw/assembly.fasta
bwa mem -v 2 -M ${runID}_assm_raw/assembly.fasta $fwdRead $revRead > bwa_mapping.sam

samtools view -b -S bwa_mapping.sam > bwa_mapping.bam 
samtools sort bwa_mapping.bam bwa_mapping_sorted
samtools index bwa_mapping_sorted.bam

pilon --genome ${runID}_assm_raw/assembly.fasta --bam bwa_mapping_sorted.bam --output $runID --outdir ${runID}_pilon --vcf

cd ..

printf "\n\n*******************************************************************************\n"
printf "Run finished for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"


## Validated May 30, 2022
##EOF
