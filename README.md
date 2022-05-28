# HybridAMRgenotyping

**Comparison of Three Dedicated Annotation Platforms for Identification of Antimicrobial Resistance Genes in Long-Read, Short-Read, and Hybrid Sequences Derived from Genomic DNA and Plasmid DNA** 

Grazieli Maboni<sup>1,2#</sup>, Rodrigo de Paula Baptista<sup>3,6,7</sup>, Joy Wireman<sup>5</sup>, Isaac Framst<sup>2</sup>, Anne O. Summers<sup>5</sup>, Susan Sanchez<sup>1,4</sup>

Affiliations 
<sup>1</sup> Athens Veterinary Diagnostic Laboratory, University of Georgia, Athens, Georgia, USA
<sup>2</sup>Department of Pathobiology, Ontario Veterinary College, University of Guelph, Guelph, Canada

<sup>3</sup>Institute of Bioinformatics, University of Georgia, Athens, Georgia, USA

<sup>4</sup> Department of Microbiology, University of Georgia, Athens, Georgia, USA

<sup>5</sup> Department of Infectious Diseases, University of Georgia, Athens, Georgia, USA

<sup>6</sup>Center for Tropical and Emerging Global Diseases, University of Georgia, Athens, Georgia, USA

<sup>7</sup>Department of Infectious Diseases, Houston Methodist Research Institute, Houston, Texas, USA

\# Corresponding author: Grazieli Maboni, gmaboni@uoguelph.ca 

Repository Information
---

This repository contains supporting documentation for hybrid Illumina miSeq and Oxford Nanopore minION bacterial plasmid assembly for the detection of antimicrobial susceptibility genotypes. Each pipeline corresponds to a unique combination of assembly methods and tools, however they can be grouped into four main methods: 
- Nanopore-only assembly 
- Illimuna-only assembly 
- Nanopore assmebly polished with Illumina reads
- Hybrid assembly

Pipelines
---------
Total genomic DNA

- [Genomic Nanopore Flye](Pipelines/Genomic_nanopore.sh)
- [Genomic Nanopore polished Flye](Pipelines/Genomic_nanopore_polished.sh)
- [Genomic Illumina](Pipelines/Genomic_Illumina.sh)
- [Genomic Hybrid](Pipelines/Genomic_hybrid.sh)

Plasmid only DNA
- [Plasmid Nanopore Flye](Pipelines/Plasmid_nanopore_flye.sh)
- [Plasmid Nanopore Canu](Pipelines/Plasmid_nanopore_canu.sh)
- [Plasmid Nanopore Unicycler](Pipelines/Plasmid_nanopore_unicycler.sh)
- [Plasmid Nanopore polished Flye](Pipelines/Plasmid_nanopore_polished_flye.sh)
- [Plasmid Nanopore polished Canu](Pipelines/Plasmid_nanopore_polished_canu.sh)
- [Plasmid Nanopore polished Unicycler](Pipelines/Plasmid_nanopore_polished_unicycler.sh)
- [Plasmid Illumina](Pipelines/Plasmid_illumina.sh)
- [Plasmid Hybrid](Pipelines/Plasmid_hybrid.sh)

[Dependencies](Manual/Install.md)
-----------
HybridAMR relies on the use of previously developed open-source software. The specific integration and configuraion of these tools is determined by the specific needs of each pipeline. This pipeline requires Linux or macOS; it is possible to use this pipeline with Apple Silicon Macs, either through Rosetta2 or by building the dependencies from source. 

[Installation](Manual/Install.md) 
-----------
As is reccomended with most bioinformatics software, this pipeline is contained in a conda environment with the necessary dependencies and python version.


[Usage](Manual/Usage.md)
----------
Reccomended system requirements: 8 core CPU, 32gb system memory, 500gb SSD

Please see the install and usage document for details.

