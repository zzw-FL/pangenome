#!/usr/bin/perl

use strict;
use warnings;

# 检查命令行参数是否提供了输入文件名
if (@ARGV != 1) {
    die "用法：perl script.pl <输入文件名>\n";
}

my $input_file = $ARGV[0]; # 获取输入文件名

# 打开输入文件进行读取
open(my $input_fh, '<', $input_file) or die "无法打开 $input_file: $!";

# 逐行读取文件内容
while (my $line = <$input_fh>) {
    chomp $line;
    my @columns = split(/\s+/, $line);  # 假设列之间使用空格分隔，可以根据实际情况修改分隔符

    # 处理第三列
    my @col3_parts = split(/,/, $columns[2]);
    my $max_char_count_col3 = 0;
    foreach my $part (@col3_parts) {
        my $char_count_col3 = length($part);
        $max_char_count_col3 = $char_count_col3 if $char_count_col3 > $max_char_count_col3;
    }

    # 处理第四列
    my @col4_parts = split(/,/, $columns[3]);
    my $max_char_count_col4 = 0;
    foreach my $part (@col4_parts) {
        my $char_count_col4 = length($part);
        $max_char_count_col4 = $char_count_col4 if $char_count_col4 > $max_char_count_col4;
    }

    print "$max_char_count_col3\t$max_char_count_col4\n";
}

# 关闭输入文件
close($input_fh);
