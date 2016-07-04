#!/usr/bin/env perl

use v5.12;
use strict;
use warnings;

use Carp;
use Getopt::Long;

sub proquint {
	if(scalar(@_) % 2) {
		croak "odd number of bytes passed";
	}


	my @c = qw(b d f g h j k l m n p r s t v z);
	my @v = qw(a i o u);

	my @out;
	while(@_) {
		my $word = shift(@_) << 8 | shift(@_);

		my $proquint = "";

		$proquint .= $c[ ($word >> 12) & 0x0F ];
		$proquint .= $v[ ($word >> 10) & 0x03 ];
		$proquint .= $c[ ($word >>  6) & 0x0F ];
		$proquint .= $v[ ($word >>  4) & 0x03 ];
		$proquint .= $c[  $word        & 0x0F ];

		push @out, $proquint;
	}

	return join('-', @out);
}

sub proquintize_hex {
	my ($hex) = @_;

	my $prefixlen = int(length($hex) / 4) * 4;

	my $prefix = substr($hex, 0, $prefixlen);
	my $suffix = substr($hex, $prefixlen);

	my @bytes = map { hex($_) } ($prefix =~ /(..)/g);
	my $proquint = proquint(@bytes);

	if($suffix) {
		$proquint .= "-$suffix";
	}

	return $proquint;
}

my $minlen = 6;

GetOptions("minlen|l=i" => \$minlen);

$| = 1;

while(my $line = <>) {
	$line =~ s/([a-fA-F0-9]{$minlen,})/proquintize_hex($1)/ge;

	print $line;
}
