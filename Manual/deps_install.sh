## Install script for Maboni et al. 2022

## Comparison of Three Dedicated Annotation Platforms for 
## Identification of Antimicrobial Resistance Genes in 
## Long-Read, Short-Read, and Hybrid Sequences Derived from 
## Genomic DNA and Plasmid DNA

## Isaac Framst (iframst@uoguelph.ca) 


mkdir HybridAMRg_deps
cd HybridAMRg_deps

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

## Prokka
brew install brewsci/bio/prokka

## AMR finder
conda install -y -c bioconda -c conda-forge ncbi-amrfinderplus

## Spades
brew install spades

## minimap2
brew install minimap2

## pilon
conda install -c bioconda pilon

##racon
conda install -c bioconda racon 

## metaphlan2
conda install -c bioconda metaphlan2 