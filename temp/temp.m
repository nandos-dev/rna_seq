%% Temp RNAseq notes 

%text pointers to follow 
 %{ 
glucose levels in yeast. 
experimental conditions, SRA ( sequence raw read files), obtaining the
short read information ). 

GEO - gseries data. Not in GEO format. 
Format will be different compared to the 

Series - single biproject 
Samples - SRA (each seq. sample is an individual SRA sample) 

Need to know strain used in the study, genome or rna sequencing 


%}



%{
wild type - 
mutation - 

remove particular gene from system, behave of the system. 
Functionality of the partciular genes, attribution to how the genes 
are mutated. 

Need to download the full sequences, -- should be able to match the 
wild-type and the mutant based on the sequence IDs

20 million reads - very large dataset 
Some outputs are defined as `N` as not being recorded or determined 

Instead of having the sequence reported as
either a C of a G. 

However, unknown based on the frequency of the basis 


%}

%{
RNA toolkit -- 
fastqfile. using the fastq-dump, 
to download the application and execute in the 
command prompt 


We usually use this command ---> execute this in the command-line 


`Files that are built and implement into the app`

binary release - already built and do not have to build app myself

-- is this the same as compiling 

-- taking a look at the executables of the applications 

-- NCBI pre-built binary kits 

-- benefit of the build an ability to not build on itself. 

-- bin (binary), possibly also include the binary code 
-- software in the application in the bin 

-- src (source code) 

-- extension on the .exe files. 

-- [options] <path> 
-- []: optional on the commands. 

-- ways of running the application 

SRD-ID becomes accession number 

spaces and pair of arguments 


%}
 
% --output file 
% tempdir can point to the directory to a subfolder 

%mapping reads to the files, will make use of the gnzip files 
%-read filer pass, remove 

%--output

--outdir ()  --gzip() --dumpbase --split 

%analyzing the number of the sequence reads
%about 75 read, quality scores
%low quality, lack of resolved nucleotides. 
%take each read and translate, find the average quality scores. 


%Need to map the quality socres under the 4th 
%quality and matching. 

% https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
% reads onto the genome -> assigning a confidence level.


%STEP3:::
%{

%mapp the short reads to the genome. 
where does the short read is on the genome yeast genome. 
Different types of yeast used. 

If strain-- on the RNAseq (related organism), if the whole genome does not
already exist

ensemble -- reference of all genes (download the sequence RNA sample) 
download the largest file, pending on the readme file, for the largest
file, mostl likely to contain the whole genome. 

searching and finding the genomes. 


%}
%downloading the genome 
%each chromosome listed as a separate sequence entry 
%low quality sequences (denoted by lower-case letters) 

%downloading and installing compiler  
%xcode and brew  (3rd-party open source software -- brew easier to
%installation for brew) 

%take source and build app 
%common - visual studio (cygwin) -- gtt and(compiler apps) gcc and
%make(creates the executable app) 

%bwa executable windows 



%STEP4: bwa function 
%{
bwa command-line function, produces output file and returns output file 

example fastq file --> 
using the index file from the fatq file and genome file (using the bwa) 
also have the index files. 

sam and bam files 
sam - readable
bam - binary files 

%}

%{
sam file - information - identifer of the read, 

%}

%{
purpose of system to run on a command prompt
making the reads to a genome. 

%}






