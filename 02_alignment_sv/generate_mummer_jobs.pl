#!/usr/bin/perl -w
use strict;
use File::Basename;
@ARGV || die "Usage $0 data <list>\n";
#my $data = shift;
my $list = shift;
#my $i;
my $pwd = `pwd`;
chomp $pwd;
open IN,$list or die "$!";
while (<IN>){
        chomp;
		my @pe2 = split /\s+/,$_;
		my $name = $pe2[0];
		my $pe1 = $pe2[1];
#		$i++;
  mkdir $name unless (-d $name);
open SH1 ,">","$name/busco.sh" or die $!;
print SH1 "/TOOLS/mummer/4.0.0rc1/bin/nucmer --prefix=$name -l 100 /DATA/Ricepan/00.data/RSB_Rhizoctonia_solani/ncbi_dataset/data/GCF_016906535.1/GCF_016906535.1_ASM1690653v1_genomic.fna $pe1 -t 8\n/TOOLS/mummer/4.0.0rc1/bin/delta-filter -l 100 -i 75 -1 $name.delta > $name.delta.filter\n/TOOLS/MUMmer-3.23/show-coords -r -c -l $name.delta.filter > $name.delta.filter.coords\n";
close SH1;
}
close IN;

######## Sub Routines ##### Good Luck ########
##### No error ### No bug ### No warning #####

