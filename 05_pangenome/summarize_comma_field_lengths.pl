#!/usr/bin/perl

use strict;
use warnings;

# Check that an input file was provided
if (@ARGV != 1) {
    die "Usage: perl script.pl <input_file>\n";
}

my $input_file = $ARGV[0]; # Get the input file name

# Open the input file
open(my $input_fh, '<', $input_file) or die "Cannot open $input_file: $!";

# Read the file line by line
while (my $line = <$input_fh>) {
    chomp $line;
    my @columns = split(/\s+/, $line);  # Whitespace-delimited columns

    # Process column 3
    my @col3_parts = split(/,/, $columns[2]);
    my $max_char_count_col3 = 0;
    foreach my $part (@col3_parts) {
        my $char_count_col3 = length($part);
        $max_char_count_col3 = $char_count_col3 if $char_count_col3 > $max_char_count_col3;
    }

    # Process column 4
    my @col4_parts = split(/,/, $columns[3]);
    my $max_char_count_col4 = 0;
    foreach my $part (@col4_parts) {
        my $char_count_col4 = length($part);
        $max_char_count_col4 = $char_count_col4 if $char_count_col4 > $max_char_count_col4;
    }

    print "$max_char_count_col3\t$max_char_count_col4\n";
}

# Close the input file
close($input_fh);
