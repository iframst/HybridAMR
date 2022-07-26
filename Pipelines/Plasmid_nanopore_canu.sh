## Assembly pipeline for Maboni et al. 2022

## Three Distinct Annotation Platforms Differ in Detection of Antimicrobial Resistance Genes in Long-Read, 
## Short-Read, and Hybrid Sequences Derived from Total Genomic DNA or from Purified Plasmid DNA

## Pipeline by Isaac Framst (iframst@uoguelph.ca) 
## University of Guelph, Department of Pathobiology
## University of Georgia, Athens Veterinary Diagnostic Laboratory

#*************************************************
echo "please assign run ID"
read runID
echo "please specify directory for raw reads"
read readDir
echo "please input expected assebmbly size (eg. 5.8g, 4m, 67k)"
read gSize

printf "\n\n*******************************************************************************\n"
printf "Run started for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"

mkdir ${runID}
mkdir ${runID}/tmp

cat ${readDir}/*.fastq > ${runID}/tmp/${runID}_all.fastq
## trim adapters and barcodes
porechop -i ${runID}/tmp/${runID}_all.fastq -o ${runID}/tmp/${runID}_trimmed.fastq --threads 8 --barcode_threshold 80

rm ${runID}/tmp/${runID}_all.fastq

# Assemble using canu
canu -p ${runID} -d ${runID}/tmp/canu genomeSize=${gSize} -nanopore ${runID}/tmp/${runID}_trimmed.fastq


# polishing step
minimap2 -x map-ont --secondary=no -t 10 assembled_raw/${runID}_assm_raw/assembly.fasta trimmed/${runID}_trimmed.fastq > temp/Polish_ONT.paf
racon trimmed/${runID}_trimmed.fastq temp/Polish_ONT.paf assembled_raw/${runID}_assm_raw/assembly.fasta > ${runID}_out/${runID}_polished.fasta

   
printf "\n\n*******************************************************************************\n"
printf "Run finished for ${runID} on $(date)\n"
printf "*******************************************************************************\n\n"


## Validated May 30 2022
## EOF