NAME

    Mojolicious::Plugin::ConfigDir - Perl-ish configuration plugin for directories

SYNOPSIS
      # myapp.conf.d/
      #    main.conf
      {
        foo       => "bar",
        music_dir => app->home->rel_dir('music')
      };

      #    extras.conf
      {
       extra => "baz"
      }

      # Mojolicious
      my $config = $self->plugin('ConfigDir');

      # Mojolicious::Lite
      my $config = plugin 'Config';

      # foo.html.ep
      %= $config->{foo}

      # The configuration is available application wide
      my $config = app->config;

      # Everything can be customized with options
      my $config = plugin Config => {file => '/etc/myapp.stuff.d/'};

DESCRIPTION
    Mojolicious::Plugin::ConfigDir is a Perl-ish configuration plugin.

    The application object can be accessed via $app or the "app" function,
    strict, warnings and Perl 5.10 features are automatically enabled. You
    can extend the normal configuration "myapp.conf.d" with "mode" specific
    ones like "myapp.$mode.conf.d". A default configuration directoryname
    will be generated by decamelizing the application class with
    "decamelize" in Mojo::Util or from the application filename.

    The code of this plugin is a good example for learning to build new
    plugins, you're welcome to fork it.

OPTIONS
    Mojolicious::Plugin::ConfigDir supports the following options.

  "default"
      # Mojolicious::Lite
      plugin ConfigDir => {default => {foo => 'bar'}};

    Default configuration, making configuration files optional.

  "ext"
      # Mojolicious::Lite
      plugin ConfigDir => {ext => 'stuff'};

    File extension for generated configuration filenames, defaults to
    "conf".

  "file"
      # Mojolicious::Lite
      plugin ConfigDir => {dir => 'myapp.conf.d/'};
      plugin ConfigDir => {dir => '/etc/foo.stuff.d/'};

    Full path to configuration file, defaults to the value of the
    "MOJO_CONFIG" environment variable or "myapp.conf" in the application
    home directory.

METHODS
    Mojolicious::Plugin::ConfigDir inherits all methods from
    Mojolicious::Plugin and implements the following new ones.

  "load"
      $plugin->load($dir, $conf, $app);

    Loads configuration file and passes the content to "parse".

      sub load {
        my ($self, $dir, $conf, $app) = @_;
        ...
        return $self->parse($content, $file, $conf, $app);
      }

  "parse"
      $plugin->parse($contents, $conf, $app);

    Parse configuration file.

      sub parse {
        my ($self, $content, $file, $conf, $app) = @_;
        ...
        return $hash;
      }

  "register"
      my $config = $plugin->register(Mojolicious->new);
      my $config = $plugin->register(Mojolicious->new, {dir => '/etc/app.conf.d/'});

    Register plugin in Mojolicious application.

SEE ALSO
    Mojolicious, Mojolicious::Guides, <http://mojolicio.us>.

