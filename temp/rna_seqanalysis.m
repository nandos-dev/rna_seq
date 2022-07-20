%% RNA-Seq Analysis 

% Template by [Fernando Ramirez  Thinh Nguyen]
% Code by [Fernando Ramirez  Thinh Nguyen]
% Adapted from []


%%Background 
% In this assignmet, you will re-analyze the RNA-seq reported in the
% following paper: 
% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4224148/


%% Find the series entry on GEO 



%% You need to find out the SRR identifiers for wild type and mutant samples. 
% For this assignment, analyzing one run form each group is sufficient. 



%% Download (in your code, if the file isn't downloaded before) the fastq 
% files from SRA (NCBI Sequence Read Archive).
    % > the fastq files are not available via your browser. You will need
    % the fastq-dump program (RNA Toolkit software) to download the fastq
    % files from NCBI. see: https://edwards.sdsu.edu/research/fastq-dump/
    
    % > Work in a smaller databset first. When code is complete, appy to
    % the origional SRA data. Expect download and analysis of original SRA
    % files to take several hours. 
    
    % > If unable to compelte the assignment using original SRA files, may 
    % use an alternative dataset (-5% fo grade penalty). You donwnload (in
    % your code, if the file isn't downloaded before) a random
    % down-sampling of the fastq files  from the following sites: 
    
    % > http://sacan.biomed.drexel.edu/ftp/rnaseq.dbp2/SRR1302790_pass.randsample.fastq
    % > http://sacan.biomed.drexel.edu/ftp/rnaseq.dbp2/SRR1302792_pass.randsample.fastq

%% DO NOT plce the fastqfile files in your dropbox folder. 
   
    % > place files in the C:\bmes 
    % > map downloads to the C: drive 
    
%% Download (in your code, if the file isn't downloaded before) the yeast genome fasta file and index it using bwa.
    % > or, download the igenome compilation for yeast, which contains
    % pre-indexed files. 
    % > DO NOT PLACE THE GENOME FASTA OR INDEX FILES IN DROPBOX FOLDER. 
    
%% Map the reads (the fastqfiles) against the yeast genome file using bmes_bwa(), which is provided to you. 




%% Download  (and build/install as needed) the featureCounts progeram (from subread package). Download links and doc from
    % > http://subread.sourceforge.net/ 
    % > you may download it manually (outisde of code, from browser)
    % > DO NOT PLACE THE GENOME FASTA OR INDEX FILES IN DROPBOX FOLDER. 
    
   




%% Use featureCounts (from your code, using a systme() call to "enrich" the mapped positions in the sam file
% into resepective gene names. 
    % > DO NOT do featureCounts of a sam file if it has been done before
    % > DO NOT PLACE THE GENOME FASTA OR INDEX FILES IN DROPBOX FOLDER.
    
    
    
    
    
%% Optional: (5% extra credit) Perform TPM normalization of gene counts data. 






%% Compare gene counts between mutant and wild type. List 10 most different (ranked by abs fold change) genes
% between the two groups. 





%% Use the genes that are differentially regulated between mutatnt and wild type. 
% You have to defind/decide what is means to be differentially regulated. 



    

%% Perform functional enrichment analysis using DAVID. Report the enrichment results using comments or snapshot 
% image(s) of DAVID enriched annotations list. 







