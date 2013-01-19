use 5.010001;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::ConfigDir',
  VERSION_FROM => 'lib/Mojolicious/Plugin/ConfigDir.pm',
  ABSTRACT     => 'Store your Mojolicious configuration in a directory',
  AUTHOR       => 'Sebastian Riedel <sri@cpan.org>',
  LICENSE      => 'artistic_2',
  META_MERGE   => {
    requires  => {perl => '5.010001'},
    resources => {
      homepage    => 'https://github.com/andreas-marschke/mojolicious-plugin-configdir',
      license     => 'http://www.opensource.org/licenses/artistic-license-2.0',
      repository  => 'https://github.com/andreas-marschke/mojolicious-plugin-configdir.git',
      bugtracker  => 'https://github.com/andreas-marschke/mojolicious-plugin-configdir/issues'
    },
  },
  test => {TESTS => 't/*.t'}
);
