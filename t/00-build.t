use strict;
use warnings;

use Test::More;
use File::Basename;
use File::Find ();

chdir dirname(__FILE__) . "/..";

use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted;

File::Find::find({wanted => \&wanted}, 'locales');
done_testing;

sub wanted {
    /^.*\.po\z/s
    && (
        system( 'msgfmt', $_ ),
        ok( !$?, "$name built OK" )
    );
}
