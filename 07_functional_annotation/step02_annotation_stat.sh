mkdir fun_ann_stat
cd fun_ann_stat
ln -s /DATA/Ricepan/08.function/SAMPLE.SingleCopyfilter.pep.fa SAMPLE.SingleCopyfilter.pep.fa && \
grep '^>' SAMPLE.SingleCopyfilter.pep.fa | sed 's/>//' | awk '{print $1}' > all_gene.id && \
ln -s /DATA/Ricepan/08.function/Interpro/SAMPLE.SingleCopyfilter.pep.fa.iprscan.xls && \
ln -s /DATA/Ricepan/08.function/KEGG/SAMPLE.SingleCopyfilter.pep.fa.blast.kegg.xls && \
ln -s /DATA/Ricepan/08.function/Swissprot/SAMPLE.SingleCopyfilter.pep.fa.blast.swissprot.xls && \
ln -s /DATA/Ricepan/08.function/Trembl/SAMPLE.SingleCopyfilter.pep.fa.blast.trembl.xls && \
ln -s /DATA/Ricepan/08.function/KOG/SAMPLE.SingleCopyfilter.pep.fa.blast.kog.xls && \
ln -s /DATA/Ricepan/08.function/NR/SAMPLE.SingleCopyfilter.pep.fa.blast.nr.xls && \
ln -s  /DATA/Ricepan/08.function/GO/SAMPLE.SingleCopyfilter.pep.fa.Gene2GO.xls && \
perl /PIPELINES/Annotation_2018/bin/03.gene_function/bin/all_function_stat.pl -list all_gene.id -Interpro SAMPLE.SingleCopyfilter.pep.fa.iprscan.xls -kegg SAMPLE.SingleCopyfilter.pep.fa.blast.kegg.xls -swissprot SAMPLE.SingleCopyfilter.pep.fa.blast.swissprot.xls -trembl SAMPLE.SingleCopyfilter.pep.fa.blast.trembl.xls -kog SAMPLE.SingleCopyfilter.pep.fa.blast.kog.xls -nr SAMPLE.SingleCopyfilter.pep.fa.blast.nr.xls -go SAMPLE.SingleCopyfilter.pep.fa.Gene2GO.xls -obo /DATABASES/Pub/go/RNA/20171220/gene_ontology.1_2.obo  -outxls ./annotation.xls --outstat ./annotation_stat.xls &&\
perl /PIPELINES/Annotation_2018/bin/03.gene_function/bin/venny.pl -infile SAMPLE.SingleCopyfilter.pep.fa.iprscan.xls,SAMPLE.SingleCopyfilter.pep.fa.blast.kegg.xls,SAMPLE.SingleCopyfilter.pep.fa.blast.swissprot.xls,SAMPLE.SingleCopyfilter.pep.fa.blast.kog.xls,SAMPLE.SingleCopyfilter.pep.fa.blast.nr.xls -name InterPro,KEGG,SwissProt,KOG,NR -header -color -outdir ./Venny -imgname Annotation.venn -num_font_size 15 && \
perl /PIPELINES/Annotation_2018/bin/03.gene_function/bin/addDesc.pl -input "./Venny/*.xls" -annot annotation.xls && \
cd ..
