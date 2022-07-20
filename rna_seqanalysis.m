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
% For this assignment, analyzing one run from each group is sufficient. 
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
    % WILD TYPE = SRR1302790
    % MUTANT TYPE = SRR1302792
%% Download (in your code, if the file isn't downloaded before) the yeast genome fasta file and index it using bwa.
    % > or, download the igenome compilation for yeast, which contains
    % pre-indexed files. 
    % > DO NOT PLACE THE GENOME FASTA OR INDEX FILES IN DROPBOX FOLDER. 
% Saccharomyces cerevisiae BY4741 genome file name
% Use this to locate your fasta files within C: Drive
[fngen,pthgen] = uigetfile({'*.gz';'*.fa';'*.*'},'Locate & Select the Genome Fasta File'); 
if contains(fngen,'.gz')
    % gunzip extract
    genomefastafile = fullfile(pthgen, fngen);
    genomefastafile = gunzip(genomefastafile);
    genomefastafile = genomefastafile{1};
else
    genomefastafile = fullfile(pthgen, fngen);
end
% Import temp fastq file to complete the function before attacking the big file
% Then, import Big Run file
% Use this to locate your files within C: Drive
[fnrnWT,pthrnWT] = uigetfile({'*.fastq';'*.gz';'*.*'},'Locate & Select the Wild Type FastQ File'); 
if contains(fnrnWT,'.gz')
    % gunzip extract
    fastqfileWT = fullfile(pthrnWT,fnrnWT);
    fastqfileWT = gunzip(fastqfileWT);
    fastqfileWT = fastqfileWT{1};
else
    fastqfileWT = fullfile(pthrnWT,fnrnWT);
end
[fnrnMT,pthrnMT] = uigetfile({'*.fastq';'*.gz';'*.*'},'Locate & Select the Mutant Type FastQ File'); 
if contains(fnrnMT,'.gz')
    % gunzip extract
    fastqfileMT = fullfile(pthrnMT,fnrnMT);
    fastqfileMT = gunzip(fastqfileMT);
    fastqfileMT = fastqfileMT{1};
else
    fastqfileMT = fullfile(pthrnMT,fnrnMT);
end
    
%% Map the reads (the fastqfiles) against the yeast genome file using bmes_bwa(), which is provided to you. 
[samfileWT,samsWT] = bmes_bwa(fastqfileWT,genomefastafile);
[samfileMT,samsMT] = bmes_bwa(fastqfileMT,genomefastafile);
%% Download  (and build/install as needed) the featureCounts progeram (from subread package). Download links and doc from
    % > http://subread.sourceforge.net/ 
    % > you may download it manually (outisde of code, from browser)
    % > DO NOT PLACE THE GENOME FASTA OR INDEX FILES IN DROPBOX FOLDER.
%% Use featureCounts (from your code, using a system() call to "enrich" the mapped positions in the sam file
% into resepective gene names. 
    % > DO NOT do featureCounts of a sam file if it has been done before
    % > DO NOT PLACE THE GENOME FASTA OR INDEX FILES IN DROPBOX FOLDER.
    % Downloaded and ready to execute
[fnfe, pthfe] = uigetfile('*.exe','Locate & Select featureCount Program');
featureCounts = fullfile(pthfe,fnfe);
[fnAN, pthAN] = uigetfile({'*.gtf';'*.gz'},'Locate & Select .gtf or annotation file');
if contains(fnAN,'.gz')
    GTFfile = fullfile(pthAN,fnAN);
    GTFfile = gunzip(GTFfile);
    GTFfile = GTFfile{1};
else
    GTFfile = fullfile(pthAN,fnAN);
end
txtfileWT = [pthAN 'sasaccharomyces_readsWT.txt'];
system([featureCounts ' "-a" "' GTFfile '" "-o" "' txtfileWT '" "' samfileWT '"'])
txtfileMT = [pthAN 'sasaccharomyces_readsMT.txt'];
system([featureCounts ' "-a" "' GTFfile '" "-o" "' txtfileMT '" "' samfileMT '"'])
%% Optional: (5% extra credit) Perform TPM normalization of gene counts data.
% reads/length for each gene and then sum normalize it
% then use the gene counts or TPM for the questions below
TWT = readtable(txtfileWT); reads = TWT{:,end}; LENG = TWT{:,'Length'};
genecountsWT_TPM = reads./LENG; genecountsWT_TPM = (genecountsWT_TPM/sum(genecountsWT_TPM))*1e6;
TWT = addvars(TWT,genecountsWT_TPM,'NewVariableNames','Gene Counts WT - TPM Normalized');

TMT = readtable(txtfileMT); reads = TMT{:,end}; LENG = TMT{:,'Length'};
genecountsMT_TPM = reads./LENG; genecountsMT_TPM = (genecountsMT_TPM/sum(genecountsMT_TPM))*1e6;
TMT = addvars(TMT,genecountsMT_TPM,'NewVariableNames','Gene Counts MT - TPM Normalized');
%% Compare gene counts between mutant and wild type. List 10 most different (ranked by abs fold change) genes
%between the two groups.
% deltaCT_WT = zeros(size(TWT,1),1); % preallocation
% deltaCT_MT = zeros(size(TMT,1),1); % preallocation
% for row = 1:size(TWT,1)
%     deltaCT_WT(row) = mean(TWT(row,'Gene Counts WT - TPM Normalized'));
%     deltaCT_MT(row) = mean(TMT(row,'Gene Counts MT - TPM Normalized'));
% end
deltadeltaCT = TMT{:,'Gene Counts MT - TPM Normalized'} - TWT{:,'Gene Counts WT - TPM Normalized'};
FC = 2.^(-deltadeltaCT);
for row = 1:size(FC,1)
    if FC(row) < 1
        FC(row) = (-1/FC(row));
    end
end
[FCsort, FCindex] = sort(abs(FC),'descend');
T = TWT(FCindex,1); T.Properties.VariableNames = {'WildTypeGeneID'};
T = [T TMT(FCindex,1)]; T.Properties.VariableNames(2) = {'MutantTypeGeneID'};
T = [T array2table(FCsort)]; T.Properties.VariableNames(3) = {'FCVal'};
T.Properties.Description = 'Top 10 Most Different Genes According to FC values';
fprintf('Top 10 Most Different Genes\n')
disp(T(1:10,:))

%% Use the genes that are differentially regulated between mutant and wild type. 
% You have to defind/decide what is means to be differentially regulated. 
%% Perform functional enrichment analysis using DAVID. Report the enrichment results using comments or snapshot 
% image(s) of DAVID enriched annotations list. 
img = imread('DavidScreenshot.png');
imshow(img)






