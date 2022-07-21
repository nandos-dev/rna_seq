# rna_seq

Here is an introduction to analyzing RNA-seq datasets as well as using DAVID for performing functional enrichment analysis. 
  
# RNA-Seq Analysis

 

# Find the series entry on GEO



#You need to find out the SRR identifiers for wild type and mutant samples.



#Download (in your code, if the file isn't downloaded before) the fastq



#DO NOT plce the fastqfile files in your dropbox folder.



#Download (in your code, if the file isn't downloaded before) the yeast genome fasta file and index it using bwa.



#Map the reads (the fastqfiles) against the yeast genome file using bmes_bwa(), which is provided to you.



#Download (and build/install as needed) the featureCounts progeram (from subread package). Download links and doc from



#Use featureCounts (from your code, using a system() call to "enrich" the mapped positions in the sam file



#Optional: (5% extra credit) Perform TPM normalization of gene counts data.

  * this section was performed, however; there were some errors being thrown. 

#Compare gene counts between mutant and wild type. List 10 most different (ranked by abs fold change) genes



#Use the genes that are differentially regulated between mutant and wild type.



#Perform functional enrichment analysis using DAVID. Report the enrichment results using comments or snapshot


