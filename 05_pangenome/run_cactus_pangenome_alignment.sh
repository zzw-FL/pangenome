export PATH=/TOOLS/USER/USER/software/Python-3.9.6/bin:/TOOLS/USER/USER/software/cactus-bin-v2.3.0/bin:$PATH
export PYTHONPATH=/TOOLS/USER/USER/software/Python-3.9.6/lib/python3.9/site-packages:/TOOLS/USER/USER/software/cactus-bin-v2.3.0/lib:/TOOLS/USER/USER/software/cactus-bin-v2.3.0/cactus_env/lib/python3.9/site-packages/:$PYTHONPATH
export PATH=/TOOLS/USER/USER/software/Python-3.9.6/lib/python3.9/site-packages/bin:$PATH
#/TOOLS/USER/USER/software/cactus-bin-v2.3.0/bin/cactus-minigraph ./jobstore SAMPLE.pg.txt SAMPLE.gfa --reference SAMPLE.2 
##Make the assembly-to-graph alignments with minigraph

#/TOOLS/USER/USER/software/cactus-bin-v2.3.0/bin/cactus-graphmap ./jobstore SAMPLE.pg.txt  SAMPLE.gfa SAMPLE.paf --reference SAMPLE  --outputFasta SAMPLE.sv.paf.fa.gz --mapCores 4 
#echo "end 1"
##step1 
#/TOOLS/USER/USER/software/Python-3.9.6/bin/cactus-graphmap-split ./jobstore SAMPLE.pg.txt SAMPLE.gfa  SAMPLE.paf  --outDir ./chroms --reference SAMPLE
echo "end 2"
## step2
/TOOLS/USER/USER/software/Python-3.9.6/bin/cactus-align-batch ./jobstore ./chroms/chromfile.txt ./chrom-alignments --alignCores 16 --alignOptions "--pangenome --reference SAMPLE --outVG"
echo "end 3"
##
/TOOLS/USER/USER/software/Python-3.9.6/bin/cactus-graphmap-join ./jobstore --vg ./chrom-alignments/*.vg --hal ./chrom-alignments/*.hal --outDir ./ --outName SAMPLE --reference SAMPLE --vcf --giraffe clip  --indexCores 24

echo "end 4"
#/TOOLS/USER/USER/software/Python-3.9.6/bin/cactus-graphmap-join ./jobstore1 --vg ./chrom-alignments/chr01.vg ./chrom-alignments/chr02.vg ./chrom-alignments/chr03.vg ./chrom-alignments/chr04.vg ./chrom-alignments/chr05.vg ./chrom-alignments/chr06.vg ./chrom-alignments/chr07.vg ./chrom-alignments/chr08.vg ./chrom-alignments/chr09.vg ./chrom-alignments/chr10.vg ./chrom-alignments/chr11.vg ./chrom-alignments/chr12.vg ./chrom-alignments/chr13.vg ./chrom-alignments/chr14.vg ./chrom-alignments/chr15.vg ./chrom-alignments/chr16.vg ./chrom-alignments/chr17.vg ./chrom-alignments/chr18.vg --hal ./chrom-alignments/chr01.hal ./chrom-alignments/chr02.hal ./chrom-alignments/chr03.hal ./chrom-alignments/chr04.hal ./chrom-alignments/chr05.hal ./chrom-alignments/chr06.hal ./chrom-alignments/chr07.hal ./chrom-alignments/chr08.hal ./chrom-alignments/chr09.hal ./chrom-alignments/chr10.hal ./chrom-alignments/chr11.hal ./chrom-alignments/chr12.hal ./chrom-alignments/chr13.hal ./chrom-alignments/chr14.hal ./chrom-alignments/chr15.hal ./chrom-alignments/chr16.hal ./chrom-alignments/chr17.hal ./chrom-alignments/chr18.hal --outDir ./ --outName SAMPLE --reference SAMPLE.2 --vcf --giraffe clip

