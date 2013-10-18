define alkivi_base::passwd (
  $file = $title,
  $type = 'user'
) {

  validate_string($type)

  # declare root dir
  if ($type == 'user')
  {
    $rootDir   = '/root/.passwd'
  }
  elsif($type == 'db')
  {
    $rootDir   = '/root/.passwd/db'
  }
  elsif($type == 'hosts')
  {
    $rootDir   = '/root/.passwd/hosts'
  }
  elsif($type == 'backup')
  {
    $rootDir   = '/root/.passwd/alkivi-backup'
  }
  elsif($type == 'ups')
  {
    $rootDir   = '/root/.passwd/ups'
  }
  elsif($type == 'ldap')
  {
    $rootDir   = '/root/.passwd/ldap'
  }
  else
  {
    fail('Param type is not correct, must be user, db or hosts')
  }

  # First generate password on the puppet master, to be able to reuse it other applications
  $password = alkivi_password($file,$type)

  # Then apply file
  file { "${rootDir}/${file}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
    content => "${password}\n",
  }

  #exec { "genpwd --save ${title} --savedir ${rootDir}":
  #  cwd     => '/root',
  #  creates => "${rootDir}/${title}",
  #  path    => ['/usr/bin', '/bin', '/usr/sbin', '/root/alkivi-scripts'],
  #  require => File['/root/alkivi-scripts/genpwd'],
  #}
}

