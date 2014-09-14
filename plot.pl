#!/usr/bin/perl -w

# 宮本　和幸

use GD::Graph::lines;

open(IN, "< data.txt");
my @item;
my @data;

while(<IN>){
	chop;
	my $tmp1 = $tmp2 = $_;
	$tmp1 =~ s/\t.*$//;
	$tmp2 =~ s/^.*\t//;
	print "$tmp1	$tmp2\n";
	push(@item, $tmp1);
	push(@data, $tmp2);
}
my $g = GD::Graph::lines->new(500,200);
my $h = GD::Text;
printf $h->font_path;
GD::Text->font_path("/usr/share/fonts/truetype/takao-gothic/");

$g->set_title_font("TakaoGothic.ttf", 12);
$g->set_x_label_font("TakaoGothic.ttf", 9);
$g->set_y_label_font("TakaoGothic.ttf", 9);
$g->set_x_axis_font("TakaoGothic.ttf", 9);
$g->set_y_axis_font("TakaoGothic.ttf", 9);

$g->set(
	title => "NEC株価",
	x_label => "日付",
	y_label => "終値",
	x_labels_vertical => 1
);
my $i = $g->plot([\@item, \@data])->png;

open(OUT, "> graph.png") or die ("Cannot open file");
binmode OUT;
#print OUT $i->png();
print OUT $i;
close OUT;
