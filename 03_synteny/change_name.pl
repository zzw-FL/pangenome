#!/usr/bin/perl

use strict;
use warnings;

# 读取第一个文件的内容并存储到哈希表
my %file1_data;
my $file1 = shift;
my $file2 = shift;
open(my $file1_fh, '<', $file1) or die "无法打开文件 file1.txt: $!";
while (my $line = <$file1_fh>) {
    chomp($line);
    my ($key, $value) = split('\s+', $line, 2);  # 限制拆分为两部分，以防止行内容含有空格
    $file1_data{$key} = $value;
}
close($file1_fh);

# 打开第二个文件，处理替换逻辑并输出结果
open(my $file2_fh, '<', $file2) or die "无法打开文件 file2.txt: $!";
open(my $output_fh, '>', 'output.txt') or die "无法创建文件 output.txt: $!";
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
