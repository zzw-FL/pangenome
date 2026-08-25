##########InterPro##########
mkdir Interpro
cd Interpro
nohup perl /PIPELINES/DNA/DNA_annotation/Annotation_2021/bin/03.gene_function/bin/run_iprscan52-86.pl --cpu 200 --cuts 500  --queue st.q  --pro_code PROJECT  --seqtype pep --resource vf=8G,num_proc=1  /DATA/Ricepan/08.function/SAMPLE.SingleCopyfilter.pep.fa &
cd ..
##########KEGG##########
mkdir KEGG
cd KEGG
nohup perl /PIPELINES/DNA/DNA_annotation/Annotation_2021/bin/03.gene_function/bin/auto_kegg_blast.pl /DATA/Ricepan/08.function/SAMPLE.SingleCopyfilter.pep.fa st.q PROJECT plant pep 500 1e-05 ./ &
cd ..
##########SwissProt##########
mkdir Swissprot
cd Swissprot
nohup perl /PIPELINES/DNA/DNA_annotation/Annotation_2021/bin/03.gene_function/bin/auto_swissprot_blast.pl /DATA/Ricepan/08.function/SAMPLE.SingleCopyfilter.pep.fa st.q PROJECT pep 500 1e-05 ./ &
cd ..
##########Trembl##########
mkdir Trembl
cd Trembl
nohup perl /PIPELINES/Annotation_2018/bin/03.gene_function/bin/auto_trembl_blast.pl /DATA/Ricepan/08.function/SAMPLE.SingleCopyfilter.pep.fa st.q PROJECT pep 500 1e-05 ./ &
cd ..
##########KOG##########
mkdir KOG
cd KOG
nohup perl /PIPELINES/Annotation_2018/bin/03.gene_function/bin/auto_KOG_blast.pl /DATA/Ricepan/08.function/SAMPLE.SingleCopyfilter.pep.fa st.q PROJECT pep 500 1e-05 ./ &
cd ..
##########NR##########
nohup perl /PIPELINES/DNA/DNA_annotation/Annotation_2021/bin/03.gene_function/bin/auto_nr_diamond.pl /DATA/Ricepan/08.function/SAMPLE.SingleCopyfilter.pep.fa st.q PROJECT all pep 500 1e-05 ./ NO &
##########Interpro 2 GO##########
