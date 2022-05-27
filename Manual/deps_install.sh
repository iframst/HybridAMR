## Install script for Maboni et al. 2022

## Comparison of Three Dedicated Annotation Platforms for 
## Identification of Antimicrobial Resistance Genes in 
## Long-Read, Short-Read, and Hybrid Sequences Derived from 
## Genomic DNA and Plasmid DNA

## Isaac Framst (iframst@uoguelph.ca) 


mkdir HybridAMRdeps
cd HybridAMRdeps

## Porechop
git clone https://github.com/rrwick/Porechop.git
cd Porechop
python3 setup.py install
porechop -h

## flye
conda install flye

## canu (use homebrew for better platform specific applications)
## works well with Apple Silicon
brew install brewsci/bio/canu

##unicycler
git clone https://github.com/rrwick/Unicycler.git
cd Unicycler
python3 setup.py install

## BWA (use brew to avoid manual add to PATH)
brew install bwa

## Samtools
brew install samtools

## QUAST
conda install -c bioconda quast

##Prokka
brew install brewsci/bio/prokka

