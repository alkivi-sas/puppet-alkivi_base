define alkivi_base::passwd (
  $type = 'user'
) {

  validate_string($type)

  # declare root dir
  if ($type == 'user')
  {
    $rootDir = '/root/.passwd'
  }
  elsif($type == 'db')
  {
    $rootDir = '/root/.passwd/db'
  }
  elsif($type == 'hosts')
  {
    $rootDir = '/root/.passwd/hosts'
  }
  elsif($type == 'backup')
  {
    $rootDir = '/root/.passwd/alkivi-backup'
  }
  elsif($type == 'ldap')
  {
    $rootDir = '/root/.passwd/ldap'
  }
  else
  {
    fail('Param type is not correct, must be user, db or hosts')
  }

  exec { "genpwd --save ${title} --savedir ${rootDir}":
    cwd     => '/root',
    creates => "${rootDir}/${title}",
    path    => ['/usr/bin', '/bin', '/usr/sbin', '/root/alkivi-scripts'],
    require => File['/root/alkivi-scripts/genpwd'],
  }
}

