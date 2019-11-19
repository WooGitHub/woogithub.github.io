#!/usr/bin/perl -w
# rename - Larry's filename fixer
#用法: Perl表达式 [要处理的文件名]
$op = shift or die "Usage: rename expr [files]\n";
#如果没有给出要处理的文件名则从标准输入读入
chomp(@ARGV = <STDIN>) unless @ARGV; 
for (@ARGV) {
    $was = $_;
    eval $op; #对待处理的文件名($_)执行用户输入的Perl表达式$op
    die $@ if $@; #退出 , 如果eval出错
    rename($was,$_) unless $was eq $_;
}
