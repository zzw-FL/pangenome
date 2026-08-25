#syri检测
export PATH=/TOOLS/mummer-4.0.0/bin/:$PATH
/TOOLS/mummer-4.0.0/bin/nucmer  --prefix=hap1_hap2 SAMPLE.hap2.chr.V3.fa  SAMPLE.hap1.chr.V3.fa  -t 4
/TOOLS/mummer-4.0.0/bin/delta-filter -1 -l 1000 -i 90 hap1_hap2.delta > hap1_hap2.delta.filter
/TOOLS/mummer-4.0.0/bin/show-coords -THrd hap1_hap2.delta.filter > hap1_hap2.delta.filter.coords
/TOOLS/USER/USER/software/Python-3.9.6/bin/syri   -c hap1_hap2.delta.filter.coords -r SAMPLE.hap2.chr.V3.fa -q SAMPLE.hap1.chr.V3.fa -d hap1_hap2.delta.filter  -k --prefix  hap1_hap2 -s /TOOLS/mummer-4.0.0/bin/show-snps

#共线性图绘制
export PYTHONPATH=/TOOLS/Python-3.10.0/lib/python3.10/site-packages/:$PYTHONPATH
/TOOLS/Python-3.10.0/bin//python3 /TOOLS/syri-1.5/syri/bin/plotsr hap1_hap2syri.out SAMPLE.hap2.chr.V3.fa SAMPLE.hap1.chr.V3.fa -H 8 -W 5 -o png

#syri图数据处理
less hap1_hap2syri.out |grep "SYN" >hap1_hap2syri.out.SYN

#R
etwd("D:/工作/03.cassava/Syri/C354/")
install.packages("GenomicRanges")
library(GenomicRanges)
library(karyoploteR)
hap1_hap2syri.out <- read.delim("hap1_hap2syri.out.SYN", header=FALSE)
hap2_chr_length <- read.delim("hap2_chr_length", header=FALSE)
chromosomes <- unique(hap1_hap2syri.out$V1)
for (chr in chromosomes) {
chr_data <- subset(hap1_hap2syri.out, hap1_hap2syri.out$V1 == chr)
png(paste0("SAMPLE.hap1_hap2.syri",chr, ".png"), bg = "white", width = 6000, height = 300)
df <- data.frame(chr=chr_data$V1, start=chr_data$V2, end=chr_data$V3)
gr <- makeGRangesFromDataFrame(df)
kp <- plotKaryotype(genome = hap2_chr_length, plot.type = 1, cex = 0.5,chromosomes = chr)
kpPlotDensity(kp,data=gr,window.size=10000,col="red")
dev.off()
}





