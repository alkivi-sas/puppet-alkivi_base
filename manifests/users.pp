class alkivi_base::users () {

  Exec {
    path => ['/usr/bin', '/bin', '/usr/sbin', '/root/alkivi-scripts'],
  }


  # default group & users
  group { 'alkivi':
    ensure => present,
    gid    => 1200,
  }

  # Define and store password
  $alkivi_password = alkivi_password('alkivi', 'user')
  $root_password = alkivi_password('root', 'user')

  alkivi_base::passwd{ 'alkivi': }
  alkivi_base::passwd{ 'root': }

  # Create users
  user { 'alkivi':
    ensure     => present,
    comment    => 'Alkivi Default User',
    uid        => 1200,
    gid        => 1200,
    home       => '/home/alkivi',
    managehome => true,
    password   => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${alkivi_password} | tr -d '\n'"),
    shell      => '/bin/bash',
  }

  user { 'root':
    ensure   => present,
    uid      => 0,
    gid      => 0,
    password => generate('/bin/sh', '-c', "mkpasswd -m sha-512 ${root_password} | tr -d '\n'"),
    home     => '/root',
    shell    => '/bin/bash',
  }
}
