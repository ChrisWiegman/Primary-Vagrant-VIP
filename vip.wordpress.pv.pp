vcsrepo { '/var/www/vip.wordpress.pv/wp':
  ensure   => present,
  provider => svn,
  source   => 'http://core.svn.wordpress.org/trunk/',
}

vcsrepo { '/var/www/vip.wordpress.pv/wp-tests':
  ensure   => present,
  provider => svn,
  source   => 'http://develop.svn.wordpress.org/trunk/',
}

vcsrepo { '/var/www/vip.wordpress.pv/wp-content/themes/vip/plugins':
  ensure   => latest,
  source   => 'https://vip-svn.wordpress.com/plugins/',
  provider => svn,
}

vcsrepo { '/var/www/vip.wordpress.pv/wp-content/themes/pub/twentyfifteen':
  ensure   => latest,
  source   => 'https://wpcom-themes.svn.automattic.com/twentyfifteen',
  provider => svn,
}

$plugins = [
  'log-deprecated-notices',
  'monster-widget',
  'query-monitor',
  'user-switching',
  'wordpress-importer',

  # WordPress.com
  'keyring',
  'mrss',
  'polldaddy',
  'rewrite-rules-inspector',
]

$github_plugins = {
  'vip-scanner'    => 'https://github.com/Automattic/vip-scanner',

  # WordPress.com
  'jetpack'        => 'https://github.com/Automattic/jetpack',
  'media-explorer' => 'https://github.com/Automattic/media-explorer',
  'writing-helper' => 'https://github.com/automattic/writing-helper',
  'amp'            => 'https://github.com/automattic/amp-wp',
}

# Delete broken plugins
file { '/var/www/vip.wordpress.pv/wp-content/plugins/log-viewer':
  ensure => 'absent',
  force  => true,
  before => Wp::Site['/var/www/vip.wordpress.pv/wp'],
}

# Install WordPress
wp::site { '/var/www/vip.wordpress.pv/wp':
  url             => 'vip.wordpress.pv',
  sitename        => 'vip.wordpress.pv',
  admin_user      => 'admin',
  admin_password  => 'password',
  network         => true,
  require         => [
    Vcsrepo['/var/www/vip.wordpress.pv/wp'],
    Class['php'],
  ]
}

# Install GitHub Plugins
$github_plugin_keys = keys( $github_plugins )
gitplugin { $github_plugin_keys:
  git_urls => $github_plugins
}

# Install plugins
wp::plugin { $plugins:
  location    => '/var/www/vip.wordpress.pv/wp',
  networkwide => true,
  require     => [
    Wp::Site['/var/www/vip.wordpress.pv/wp'],
    Gitplugin[ $github_plugin_keys ],
  ]
}

# Symlink db.php for Query Monitor
file { '/var/www/vip.wordpress.pv/wp-content/db.php':
  ensure  => 'link',
  target  => 'plugins/query-monitor/wp-content/db.php',
  require => Wp::Plugin['query-monitor']
}

wp::option { 'siteurl':
  ensure   => equal,
  value    => 'http://vip.wordpress.pv/wp',
  location => '/var/www/vip.wordpress.pv/wp',
  require  => Wp::Site['/var/www/vip.wordpress.pv/wp'],
}

apache::vhost { 'vip.wordpress.pv':
  docroot                  => '/var/www/vip.wordpress.pv',
  directory                => '/var/www/vip.wordpress.pv',
  directory_allow_override => 'All',
  ssl                      => true,
  template                 => '/vagrant/provision/lib/conf/vhost.conf.erb',
}

mysql_database { 'tests.vip.wordpress.pv':
  ensure  => 'present',
  charset => 'utf8',
  collate => 'utf8_general_ci',
  require => Class['mysql::server'],
}

mysql_database { 'vip.wordpress.pv':
  ensure  => 'present',
  charset => 'utf8',
  collate => 'utf8_general_ci',
  require => Class['mysql::server'],
}