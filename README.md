# MP_RNAseq

This repository includes the generated code for M. polymorpha transcriptome analysis under Cd stress and intermediate files created.

Raw data were generated with Ion Proton instead Illumina, so it is not possible to use [Nf-core/rnaseq pipeline](https://nf-co.re/rnaseq/3.3/usage) this time. 
Instead I will follow the workflow described [here](https://github.com/maggimars/rnaSkillPill/blob/master/RNA-seq.md) adapting our data to it. 

*Marchantia polymorpha* genome can be obtained [here](https://marchantia.info/download/MpTak1_v5.1r2/)

Fasta files are compressed and available in the directory MP_rna of Flash (*Deigo*, Okinawa Institute of Science and Technology)

Once in flash create a new directory `mkdir MP_rna`

Enter in the folder `cd MP_rna`

Move the folder containing the raw sequences to this folder `mv /flash/MitaraiU/Angela/rawfiles .`



## FastQ screening

I need to generate first the FastQ files to compile them later with MultiQC

`module load fastqc/0.11.9`

Enter in the folder with the raw files `cd rawfiles_unzipped`

`srun --pty --mem 1G -p short /bin/bash`

`fastqc -t 8 IonXpressRNA*`

Alternatively we can create a .slurm file which include the code for FastQ running but it needs to be outside the folder containing the raw files. 

`nano fastqc.slurm`

```
