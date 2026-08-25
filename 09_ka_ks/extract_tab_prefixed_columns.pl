#!/usr/bin/perl
use strict;
use warnings;

open my $file, '<', "tt" or die "Cannot open file: $!";

while (my $line = <$file>) {
    chomp $line; # Remove the trailing newline
    
    # Split by spaces first, then recover columns that started with a tab.
    my @parts = split / /, $line;
    my @tab_started_columns;
    
    foreach my $part (@parts) {
        # Keep fields that originally began with a tab.
        if ($part =~ /^\t/) {
            push @tab_started_columns, $part;
        }
    }
    
    # Print the recovered tab-prefixed columns.
    foreach my $column (@tab_started_columns) {
        # Strip the leading tab for display.
        $column =~ s/^\t//;
        print "$column\n";
    }
}

close $file;
