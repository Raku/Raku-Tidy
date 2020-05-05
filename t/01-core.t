use v6;

use Test;
use Raku::Tidy;

plan 2;

subtest {
	my $pt = Raku::Tidy.new;
	my $source = Q{1+2};
	my $parsed = $pt.tidy( $source );
	is $parsed, $source, Q{No alterations};

	done-testing;
}, Q{No alterations};

subtest {
	my $source = Q{1+2 # foo};

	subtest {
		my $pt = Raku::Tidy.new;
		my $parsed = $pt.tidy( $source );
		is $parsed, $source, Q{No alterations};

		done-testing;
	}, Q{no alterations};

	subtest {
		plan 1;
		
		my $pt = Raku::Tidy.new( :strip-comments( True ) );
		my $tidied = Q{1+2};
		my $parsed = $pt.tidy( $source );
		is $parsed, $tidied, Q{strip comments};
	}, Q{strip comments};
}, Q{Comment};

# vim: ft=raku
