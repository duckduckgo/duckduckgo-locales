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

sub translation_check {
    my ( $msgid, $msgstr ) = map { s/^"//r =~ s/"$//r } @_;
    return 1 unless $msgstr eq "";
}

File::Find::find({wanted => \&wanted}, 'locales');
done_testing;

sub wanted {
    /^.*\.po\z/s || return;
    my $po = Locale::PO->load_file_asarray( $_ );
    for ( @{ $po } ) {
        next unless $_->msgctxt;
        next unless $_->msgctxt =~ /Ads\sGDPR,\sinternal\suse\sonly\.\sDo\snot\schange/;
        ok( translation_check( $_->msgid, $_->msgstr ),
          'Translation for ' . $_->msgid . ' in ' . $name . ' should not be changed : ' . $_->msgstr )
    }
}

