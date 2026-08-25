#!/usr/bin/perl

use strict;
use warnings;

my $input_file = shift;
my $output_file = shift;

open(my $input_fh, '<', $input_file) or die "无法打开 $input_file: $!";
open(my $output_fh, '>', $output_file) or die "无法创建 $output_file: $!";

while (my $line = <$input_fh>) {
  chomp $line;
  if ($line =~ /^>(.*=)(.*)$/) {
    $line = ">" . $2;
  }
  print $output_fh $line . "\n";
}

close($input_fh);
close($output_fh);
