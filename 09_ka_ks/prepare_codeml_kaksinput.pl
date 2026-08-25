#!/usr/bin/perl -w
use strict;

die "Usage perl $0 indir outdir tree \n This script is used for creat for to run codeml for caclute ka/ks or positive selection.\n You need to supply three input. The first is a dir with the all alignmented single-copy sequences, the second is the outputdir, and the third is a input tree\n" if (@ARGV<3);

my $dir=shift;
my $output=shift;
my $tree=shift;
open TT,"> run_total_paml.sh";
open IN2,"$tree" || die "We can't find the tree file:$_";
my $topu;
while (<IN2>){
	$topu=$_;
	}
close IN2;
mkdir "$output" if (!-d $output);
my @a=grep {$_=~/2\.fas$/}`ls $dir`;
foreach my $n(@a){
	next if ($n=~/^(\s+)$/);
	next if ($n=~/^(\.)$/);
	my (%hash,%hash_tree);
	open IN,"$dir/$n" || die "can't open such file:$!";
	my $out=$1 if ($n=~/(\w+)/);
    $/=">";
	<IN>;
	$/="\n";
	my $i=0;
	my $length;
	while (<IN>){
		my $name=$1 if (/(\S+)/);
		my $tag=(split /_/,$name)[-1];
		$hash_tree{$tag}=$name;
		$/=">";
		my $seq=<IN>;
		$/="\n";
		$seq=~s/\s+|\n|>//g;
		$seq =~ s/\G(([\w-]{3})*?)(TAA|TAG|TGA)/$1---/ig;
		$seq =~ s/^(ATG)/---/ig;
		$seq =~ s/TAA(-*)$|TAG(-*)$|TGA(-*)$/---($1)/ig;
		$hash{$name}=$seq;
		$length=length($seq);
	    $i++;
		}
	close IN;	
	next if ($length <=3);
    mkdir "$output/$out" if (! -d "$output/$out");
	open OUT,">$output/$out/$out.phy" || die "Can't open such file:$!";
	print OUT "  $i          $length\n";
	foreach (keys %hash){
		print OUT "$_          $hash{$_}\n";
		}
	close OUT;
#Print OUT the ctl file in the subdir;
	open CTL,">$output/$out/$out.ctl";
	print CTL "seqfile =  $out.phy
treefile = $out.tree
outfile = $out.mlc
noisy = 0	* 0,1,2,3,9: how much rubbish on the screen
runmode = 0	* 0: user tree;  1: semi-automatic;  2: automatic 3: StepwiseAddition; (4,5):PerturbationNNI; -2: pairwise
seqtype = 1	* 1:codons; 2:AAs; 3:codons-->AAs
CodonFreq = 2	* 0:1/61 each, 1:F1X4, 2:F3X4, 3:codon table
ndata = 1	* specifies the number of separate data sets in the file
clock = 0	* 0: no clock, unrooted tree, 1: clock, rooted tree
model = 1	* models for codons:
                * 0:one, 1:b, 2:2 or more dN/dS ratios for branches
			    * models for AAs or codon-translated AAs:
				* 0:poisson, 1:proportional, 2:Empirical, 3:Empirical+F
				* 6:FromCodon, 8:REVaa_0, 9:REVaa(nr=189)

NSsites = 0 * 0:one w; 1:neutral; 2:positive selection; 3:discrete; 4:freqs;
                * 5:gamma; 6:2gamma; 7:beta; 8:beta&w; 9:beta&gamma;
				* 10:beta&gamma+1; 11:beta&normal>1; 12:0&2normal>1;
				* 13:3normal>0

icode = 0	* 0:universal code; 1:mammalian mt; 2-11:see below
Mgene = 0 * 0:rates, 1:separate;
fix_kappa = 0 * 1: kappa fixed, 0: kappa to be estimated
kappa = 0 * initial or fixed kappa
fix_omega = 0 * 1: omega or omega_1 fixed, 0: estimate
omega = 0.4 
fix_alpha = 1 
alpha = 0
Malpha = 0
getSE = 0
RateAncestor = 1 * (0,1,2): rates (alpha>0) or ancestral states (1 or 2)
Small_Diff = .5e-6 
cleandata = 1
method = 0";
    open TREE,">$output/$out/$out.tree"	;
	my $temp=$topu;
	foreach (keys %hash_tree ){
		$temp=~s/$_/$hash_tree{$_}/;
		}
	$temp .=";" unless ($temp=~/(\;)$/);
	print TREE "$temp";
#	open SH,">$output/$out/paml.sh";
#	print SH "/opt/blc/genome/biosoft/paml-4.5/bin/codeml $out.ctl";
	print TT "cd $output/$out\; /TOOLS/paml-4.9e/bin/codeml $out.ctl\n";
	}
 	

