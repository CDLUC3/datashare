#!/usr/bin/perl
open (ERCDIR, "<ercdir.txt") or die "cannot open dir file";

while (<ERCDIR>)
{
$ercname = $_;
$dcshoulder = $ercname;
$dcshoulder =~ s/ark\+\=(.*?)\=(.*?)$/$2/;
chomp($dcshoulder);
$ercdir = "\.\\data\\erc\\" . $ercname;
chomp($ercdir);
$ercfilename = $ercdir . "\\mrt-erc.txt";
$dcfilename = $ercdir . "\\" . $dcshoulder . "\.dc\.xml";
open (ERC, "<$ercfilename") or die "cannot open file";
open (DC, ">$dcfilename") or die "cannot open out file";

print DC "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n";


while (<ERC>)
{
my $a = $_;

$a =~ s/\n$//;
if ($a =~ /^\n/)
{
$a =~ s/\n//;
}

if ($a =~ /^erc/)
{
$a =~ s/erc:/<dc>\n/;
print DC $a;
}

elsif ($a =~ /^who/)
{
$a = $a . "</creator>\n";
$a =~ s/who: /<creator>/;
$a =~ s/\; /<\/creator>\n<creator>/g;
print DC $a;
}

elsif ($a =~ /^what/)
{
$a = $a . "</title>\n";
$a =~ s/what: /<title>/;
print DC $a;
}

elsif ($a =~ /^when/)
{
$a = $a . "</date>\n";
$a =~ s/when: /<date>/;
print DC $a;
}

elsif ($a =~ /^where/)
{
if (length($a) > length("where: "))
{
$a = $a . "</identifier>\n";
$a =~ s/where: /<identifier>/;
print DC $a;
}
}

elsif ($a =~ /^(.*?):/)
{
$a =~ m/^(.*?): (.*)/;
$tagname=$1;
$a =~ s/^(.*?): (.*)/<$1>$2<\/$1>\n/;
if ($tagname ne "description")
{ $a =~ s/\; /<\/$tagname>\n<$tagname>/g; }
print DC $a;
}

}
print DC "</dc>";

close (ERC);
close (DC);
}

close (ERCDIR);
