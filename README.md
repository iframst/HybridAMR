# HybridAMR
Bioinformatic pipeline for &lt;Name of paper>

The repository contains supporting documentation for hybrid Illumina miSeq and Oxford Nanopore minION bacterial plasmid assembly for the detection of antimicrobial susceptibility genotypes. Each pipeline is designed to validate a specific set of input conditions.

Pipelines
---------
Total genomic DNA
- [Genomic Nanopore](Pipelines/Genomic_nanopore.sh)
- [Genomic Illumina](Pipelines/Genomic_Illumina.sh)
- [Genomic Hybrid](Pipelines/Genomic_hybrid.sh)

Plasmid DNA only
- [Plasmid Nanopore](Pipelines/Plasmid_Nanopore.sh)
- [Plasmid Illumina](Pipelines/Plasmid_Illumina.sh)
- [Plasmid Hybrid](Pipelines/Plasmid_hybrid.sh)

[Dependencies](Manual/Install.md)
-----------
HybridAMR relies on the use of previously developed open-source software. The specific integration and configuraion of these tools is determined by the specific needs of each pipeline. This pipeline requires Linux or macOS; it is possible to use this pipeline with Apple Silicon Macs, either through Rosetta2 or by building the dependencies from source. 

[Installation](Manual/Install.md) 
-----------
As is reccomended with most bioinformatics software, this pipeline is contained in a conda environment with the necessary dependencies and python version.


[Usage](Manual/Usage.md)
----------
Reccomended system requirements: 8 core CPU, 32gb system memory, 256gb SSD

