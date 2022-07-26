## Assembly pipeline for Maboni et al. 2022

## Three Distinct Annotation Platforms Differ in Detection of Antimicrobial Resistance Genes in Long-Read, 
## Short-Read, and Hybrid Sequences Derived from Total Genomic DNA or from Purified Plasmid DNA

## Pipeline by Isaac Framst (iframst@uoguelph.ca) 
## University of Guelph, Department of Pathobiology
## University of Georgia, Athens Veterinary Diagnostic Laboratory

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


## remove potenetial species contamination 
metaphlan2 --input_type fastq -t rel_ab_w_read_stats $fwdRead,$revRead,$readsIN_ONT/*.fastq > ${runID}_metaphlan_profile.txt

## remove ONT sequencing  adapters (works with rapid barcode and native barcode kits)
## Other kits may need adapters and barcodes specified accordign to porechop manual
porechop -i $readsIN_ONT -o ${runID}_porechop.fastq

## Spades automatically detects this as a hybrid assembly mode, --plasmid must be specified however
spades.py -1 $fwdRead -2 $revRead --nanopore ${runID}_porechop.fastq -o ${runID}_spades -m 1024 --plasmid

## 
bwa index ${runID}_spades/scaffolds.fasta
bwa mem -v 2 -M ${runID}_spades/scaffolds.fasta $fwdRead $revRead ${runID}_porechop.fastq > bwa_mapping.sam

## convert sequence alignment from BWA into a sorted binary alignment, which is needed for pilon
samtools view -b -S bwa_mapping.sam > bwa_mapping.bam 
samtools sort bwa_mapping.bam bwa_mapping_sorted
samtools index bwa_mapping_sorted.bam

## hybrid assembly polishing using illuimina reads
pilon --genome ${runID}_spades/contigs.fasta --bam bwa_mapping_sorted.bam --output $runID --outdir ${runID}_pilon --vcf

## pipeline validated May 30 2022
## EOF