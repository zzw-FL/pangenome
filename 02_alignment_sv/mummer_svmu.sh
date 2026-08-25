echo start at time `date +%F'  '%H:%M`
/TOOLS/mummer/4.0.0rc1/bin/nucmer --prefix=SAMPLE -l 100 /DATA/Ricepan/00.data/SAMPLE/SAMPLE_Genome.test.fasta /DATA/Ricepan/00.data/SAMPLE/SAMPLE.fasta -t 8 &&  echo This-Work-is-Completed!
/TOOLS/mummer/4.0.0rc1/bin/delta-filter -l 100 -i 75 -g SAMPLE.delta >SAMPLE.delta.filter &&  echo This-Work-is-Completed!
/TOOLS/mummer/4.0.0rc1/bin/show-coords -THrd SAMPLE.delta.filter &&  echo This-Work-is-Completed!
echo finish at time `date +%F'  '%H:%M`
/TOOLS/USER/USER/software/svmu-master/svmu  SAMPLE.delta.filter /DATA/Ricepan/00.data/SAMPLE/SAMPLE_Genome.test.fasta /DATA/Ricepan/00.data/SAMPLE/SAMPLE.fasta h --prefix hap1

less sv.hap1.txt|grep -v "REF"|grep -v "CNV" |awk '{if ($2 > $3) {print $1"\t"$3"\t"$2"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11}else{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11}}' >sv.hap1.chr.txt.step1
less sv.hap1.chr.txt.step1|sort -V -k 1,3|awk '{if($2 >0){print}}'|sortBed >sv.hap1.chr.txt.step2
/TOOLS/bedtools/2.29.2/bin/bedtools merge -d 10 -i sv.hap1.chr.txt.step2 -c 2,4,5,6,7,8,9,10,11 -o count,collapse,collapse,collapse,collapse,collapse,collapse,collapse,collapse -delim ";"  >sv.hicsv.hap1.chr.txt.step2.merge
less sv.hicsv.hap1.chr.txt.step2.merge|awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$1"\t"$2"\t"$3"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12"\t0"}' >sv.hap1.chr.txt.noCNV.merge.input
less sv.hap1.chr.txt.noCNV.merge.input |perl -ane '{chomp;$k=0;@a=split;if($a[3] >1){print $a[0]."\t".$a[1]."\t".$a[2]."\t"."1"."\t".$a[4]."\t".$a[5]."\t".$a[6]."\t";if($a[7] =~/INS/){@b=split/;/,$a[7];for($j=0;$j <@b;$j++){if($b[$j] =~/INS/ && $k==0){print $b[$j]."\t";$k++;for($d=8;$d <@a-1;$d++){@e=split/;/,$a[$d];print $e[$j]."\t";}print $a[-1]."\t";}}}if($a[7] =~/DEL/){@b=split/;/,$a[7];for($j=0;$j <@b;$j++){if($b[$j] =~/DEL/ && $k==0){print $b[$j]."\t";$k++;for($d=8;$d <@a-1;$d++){@e=split/;/,$a[$d];print $e[$j]."\t";}print $a[-1]."\t";}}}print "\n"} if($a[3] ==1){print $_."\n"}}'  >sv.hap1.chr.txt.noCNV.merge.input.1
less sv.hap1.chr.txt.noCNV.merge.input.1|awk '{if(NF >10){print}}' >sv.hap1.chr.txt.noCNV.merge.input.2
less sv.hap1.chr.txt.noCNV.merge.input.2 |while read i;do /TOOLS/python-2.7.10/bin/python2.7  /TOOLS/USER/USER/pipeline/04.population/09.VG/01.assembly_svmu/mahul2VCF.py $i;done >SAMPLE.vcf
