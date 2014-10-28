class alkivi_base::scripts () {
  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
  }

  # script to generate securedata files
  file { '/usr/bin/gensecuredata':
    ensure  => file,
    source  => 'puppet:///modules/alkivi_base/scripts-helpers/gensecuredata',
  }

}
