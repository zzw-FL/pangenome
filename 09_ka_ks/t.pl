#!/usr/bin/perl
use strict;
use warnings;

open my $file, '<', "tt" or die "Cannot open file: $!";

while (my $line = <$file>) {
    chomp $line; # 移除结尾的换行符
    
    # 首先按空格分列，因为按照需求，'\t'也是我们需要识别的一部分
    # 但是这样会损失原始的'\t'，所以这里采取间接的方式处理
    my @parts = split / /, $line;
    my @tab_started_columns;
    
    foreach my $part (@parts) {
        # 如果分列后的元素中存在以'\t'开头的情况（配合原始行的特点），就将它加入结果列表
        if ($part =~ /^\t/) {
            push @tab_started_columns, $part;
        }
    }
    
    # 打印以'\t'开头的列
    foreach my $column (@tab_started_columns) {
        # 移除开头的'\t'仅为了展示目的
        $column =~ s/^\t//;
        print "$column\n";
    }
}

close $file;
