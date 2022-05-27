## Genomic DNA Hybrid assembly pipeline for Maboni et al. 2022

## Comparison of Three Dedicated Annotation Platforms for 
## Identification of Antimicrobial Resistance Genes in 
## Long-Read, Short-Read, and Hybrid Sequences Derived from 
## Genomic DNA and Plasmid DNA

## Isaac Framst (iframst@uoguelph.ca) 

printf "Run started on $(date) \n"
printf "Hybrid Genomic DNA assembly"

echo "run ID assignment or isolate name"
read runID

echo "Please specify sample input file or dir for ONT reads (fastq)"
read readsIN_ONT

echo "Please specify forward reads file (fastq)"
read fwdRead

echo "Please specify reverse reads file (fastq)"
read revRead

mkdir $runID
cd $runID


metaphlan --input_type fastq -t rel_ab_w_read_stats $fwdRead,$revRead,$readsIN_ONT > ${runID}_metaphlan_profile.txt

porechop -i $readsIN_ONT -o $runID_porechop.fastq







