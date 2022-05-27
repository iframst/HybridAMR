## Use the pipelines

To download all the pipelines:

    git clone https://github.com/iframst/HybridAMRg.git
    cd HybridAMRg/pipelines
    
Run a pipeline

    bash <pipeline_name>.sh

    ## example
    bash Genomic_hybrid.sh

Inputs and outputs
---
**Inputs**  
Each pipeline takes as input a file or directory containing fastq reads. The pipeline is designed to take a single sample as input, multiple samples can be run by looping the bash script.

Expected genome (or plasmid) size

Number of threads


**Outputs**  
A directory containing results of each sub-program, and the final assembly with corresponding annotation report. Outputs are named acording to the input file/dir.

