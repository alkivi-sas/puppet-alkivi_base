class alkivi_base::scripts () {
  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
  }

  file {  '/root/alkivi-scripts/':
    ensure  => directory,
  }

  # script to generate password
  file { '/root/alkivi-scripts/genpwd':
    source  => 'puppet:///modules/alkivi_base/scripts-helpers/genpwd',
    require => File['/root/alkivi-scripts/'],
  }

  # symlink
  file { '/usr/bin/genpwd':
    ensure  => link,
    target  => '/root/alkivi-scripts/genpwd',
    require => File['/root/alkivi-scripts/genpwd'],
  }

  # script to set password
  file { '/root/alkivi-scripts/setpwd':
    source  => 'puppet:///modules/alkivi_base/scripts-helpers/setpwd',
    require => File['/root/alkivi-scripts/'],
  }

  file { '/usr/bin/setpwd':
    ensure  => link,
    target  => '/root/alkivi-scripts/setpwd',
    require => File['/root/alkivi-scripts/setpwd'],
  }

  # script to generate securedata files
  file { '/root/alkivi-scripts/gensecuredata':
    source  => 'puppet:///modules/alkivi_base/scripts-helpers/gensecuredata',
    require => File['/root/alkivi-scripts/'],
  }

  file { '/usr/bin/gensecuredata':
    ensure  => link,
    target  => '/root/alkivi-scripts/gensecuredata',
    require => File['/root/alkivi-scripts/gensecuredata'],
  }

  # support helper
  file { '/root/alkivi-scripts/support':
    source  => 'puppet:///modules/alkivi_base/scripts-helpers/support',
    require => File['/root/alkivi-scripts/'],
  }

  file { '/usr/bin/support':
    ensure  => link,
    target  => '/root/alkivi-scripts/support',
    require => File['/root/alkivi-scripts/support'],
  }
}
