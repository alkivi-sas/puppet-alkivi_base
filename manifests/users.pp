class alkivi_base::users () {

  Exec {
    path => ['/usr/bin', '/bin', '/usr/sbin', '/root/alkivi-scripts'],
  }


  # default group & users
  group { 'alkivi':
    ensure => present,
    gid    => 1000,
  }

  user { 'alkivi':
    ensure     => present,
    comment    => 'Alkivi Default User',
    uid        => 1000,
    gid        => 1000,
    home       => '/home/alkivi',
    managehome => true,
  }

  exec { 'passwd-alkivi':
    command => 'setpwd --name alkivi',
    creates => '/root/.passwd/alkivi',
    require => [ User['alkivi'], File['/root/alkivi-scripts/setpwd'], ],
  }

  exec { 'passwd-root':
    command => 'setpwd --name root',
    creates => '/root/.passwd/root',
    require => File['/root/alkivi-scripts/setpwd'],
  }
}
