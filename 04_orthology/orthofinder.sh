export OPENBLAS_NUM_THREADS=1
export PATH=/TOOLS/OrthoFinder/bin/:/TOOLS/RAxML-8.2.4/:/TOOLS/mafft-7.310-with-extensions/bin:/TOOLS/FastTree-2.1/:/TOOLS/USER/USER/software/iqtree/iqtree-1.6.12-Linux/bin/:$PATH

/TOOLS/OrthoFinder-2.3.11/orthofinder -f /DATA/Ricepan/04.orthofinder/00.pep -t 32 -a 1 -M msa -S diamond -A mafft -T iqtree -o ./result -og
