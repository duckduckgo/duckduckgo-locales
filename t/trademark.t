use strict;
use warnings;

use Test::More;
use File::Basename;
use File::Find ();
use Locale::PO;

chdir dirname(__FILE__) . "/..";

use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted;

sub trademark_check {
    my ( $msgid, $msgstr ) = map { s/^"//r =~ s/"$//r } @_;
    return 1 unless $msgid && $msgstr;
    $msgstr =~ /DuckDuckGo/;
}

File::Find::find({wanted => \&wanted}, 'locales');
done_testing;

sub wanted {
    /^.*\.po\z/s || return;
    my $po = Locale::PO->load_file_asarray( $_ );
    return if $po->[0]->has_flag('fuzzy');
    for ( @{ $po } ) {
        next if $_->has_flag('fuzzy');
        next unless $_->msgid =~ /DuckDuckGo/;
        ok( trademark_check( $_->msgid, $_->msgstr ),
          'Translation for ' . $_->msgid . ' in ' . $name . ' does not contain DuckDuckGo : ' . $_->msgstr )
    }
}

