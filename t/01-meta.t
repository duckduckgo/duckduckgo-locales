use strict;
use warnings;

use Test::More;
use File::Basename;
use Cpanel::JSON::XS qw/ decode_json /;
use Scalar::Util qw/ reftype /;
use Test::Fatal qw/ lives_ok /;

chdir dirname(__FILE__) . "/..";

my $locales;
my $file = 'locales.json';

lives_ok {
    $locales = decode_json( do {
        local $/ = undef;
        open my $fh, '<', $file or die "could not open $file: $!";
        <$fh>;
    } )
} 'locales.json parsed OK';

is( reftype $locales, 'HASH', 'locales data appears to exist' );
my @locale_codes = keys %{ $locales };
ok( @locale_codes > 0, 'locales data appears to be populated' );

for my $locale_code ( @locale_codes ) {
    for my $key ( qw/ locale name_in_english name_in_local rtl / ) {
        ok( defined( $locales->{ $locale_code }->{ $key } ),
            "$key defined for $locale_code" );
    }
}

done_testing;
