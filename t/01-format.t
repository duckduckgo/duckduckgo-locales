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

# Since there are currently no plural or numeric translations,
# this should suffice for now
sub simple_sprintf_check {
    my ( $msgid, $msgstr ) = map { s/^"//r =~ s/"$//r } @_;
    my $sprintf_re = qr/%\d?s/;
    return 1 unless $msgid && $msgstr;
    my $cmsgid = () = $msgid =~ /%s/g;
    my $cmsgstr = () = $msgstr =~ /%(?:\d\$)?s/g;
    return ( $cmsgid == $cmsgstr );
}

File::Find::find({wanted => \&wanted}, 'locales');
done_testing;

sub wanted {
    /^.*\.po\z/s || return;
    for ( @{ Locale::PO->load_file_asarray( $_ ) } ) {
        ok( simple_sprintf_check( $_->msgid, $_->msgstr ),
          "$name - specifier " . $_->msgid . " matches " . $_->msgstr )
    }
}

