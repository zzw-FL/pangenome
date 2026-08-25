#less SAMPLE.vcf.gz |perl -ane '{chomp;if(/#/){print $_."\n"}else{@a=split;$len1 =length($a[3]);$len2 =length($a[4]); $k=0;if($len1 >=50 && $len1 <1000000000){$k++};if($len2 >=50 && $len2 <1000000000){$k++}; if($k >0){print $_."\n"}}}' >SAMPLE.sv.vcf
## index 
/TOOLS/USER/USER/software/vg construct -r  /DATA/Ricepan/00.data/RB_Magnaporthe_oryzae/ncbi_dataset/data/SAMPLE/GCF_000002495.2_SAMPLE_genomic.fna -v  SAMPLE.sv.vcf –a  >SAMPLE.xa.vg
/TOOLS/USER/USER/software/vg construct -r  /DATA/Ricepan/00.data/RB_Magnaporthe_oryzae/ncbi_dataset/data/SAMPLE/GCF_000002495.2_SAMPLE_genomic.fna -v  SAMPLE.sv.vcf >SAMPLE.vg
/TOOLS/USER/USER/software/vg index SAMPLE.vg -x SAMPLE.xg
/TOOLS/USER/USER/software/vg index SAMPLE.xa.vg -x SAMPLE.xa.xg -L
/TOOLS/USER/USER/software/vg snarls  SAMPLE.xa.xg >SAMPLE.xa.snarls
## index by ourself
` mkdir ./TMPDIR1/`
/TOOLS/USER/USER/software/vg autoindex --workflow giraffe --tmp-dir  ./TMPDIR1 -R XG --ref-fasta /DATA/Ricepan/00.data/RB_Magnaporthe_oryzae/ncbi_dataset/data/SAMPLE/GCF_000002495.2_SAMPLE_genomic.fna  --vcf SAMPLE.sv.vcf  -p SAMPLE  ##produce SAMPLE.xg;SAMPLE.giraffe.gbz;SAMPLE.min
/TOOLS/USER/USER/software/vg gbwt -o SAMPLE.gbwt -g SAMPLE.gg -Z SAMPLE.giraffe.gbz
/TOOLS/USER/USER/software/vg snarls  SAMPLE.xg >SAMPLE.snarls
##
#[vg autoindex] Executing command: /TOOLS/USER/USER/software/vg autoindex --workflow giraffe --tmp-dir ./TMPDIR1 -R XG --ref-fasta /DATA/USER/USER/02.cassava642/04.three.assembly_genetic/SAMPLE_hap1_hap2/SAMPLE.hap2.genetic.chr.sort.V2.fa --vcf SAMPLE.sv.vcf -p SAMPLE
#[IndexRegistry]: Checking for phasing in VCF(s).
#[IndexRegistry]: Chunking inputs for parallelism.
#[IndexRegistry]: Chunking FASTA(s).
#[IndexRegistry]: Chunking VCF(s).
#[IndexRegistry]: Constructing VG graph from FASTA and VCF input.
#[IndexRegistry]: Constructing GBWT from VG graph and phased VCF input.
#[IndexRegistry]: Merging contig GBWTs.
#[IndexRegistry]: Stripping allele paths from VG.
#[IndexRegistry]: Constructing XG graph from VG graph.
#[IndexRegistry]: Downsampling full GBWT.
#[IndexRegistry]: Not enough haplotypes; augmenting the full GBWT instead.
#[IndexRegistry]: Constructing GBZ.
#[IndexRegistry]: Finding snarls in graph.
#[IndexRegistry]: Constructing distance index for Giraffe.
#[IndexRegistry]: Constructing minimizer index.
#error[VPKG::load_one]: Could not open SAMPLE.gbz while loading gbwtgraph::GBZ
