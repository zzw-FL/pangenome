#!/usr/bin/perl

use strict;
use warnings;

# Read the first file into a mapping table
my %file1_data;
my $file1 = shift;
my $file2 = shift;
open(my $file1_fh, '<', $file1) or die "Cannot open file1.txt: $!";
while (my $line = <$file1_fh>) {
    chomp($line);
    my ($key, $value) = split('\s+', $line, 2);  # Split only once so values may contain spaces
    $file1_data{$key} = $value;
}
close($file1_fh);

# Open the second file, replace IDs, and write the result
open(my $file2_fh, '<', $file2) or die "Cannot open file2.txt: $!";
open(my $output_fh, '>', 'output.txt') or die "Cannot create output.txt: $!";
while (my $line = <$file2_fh>) {
    chomp($line);
    my @columns = split('\s+', $line); 
    if (exists $file1_data{$columns[0]}) {
        $columns[0] = $file1_data{$columns[0]};
    }
    print $output_fh join('\t', @columns), "\n";
}
close($file2_fh);
close($output_fh);
