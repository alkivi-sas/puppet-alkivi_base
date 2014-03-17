class alkivi_base (
  $alkivi_extra_ssh_keys = [],
  $root_extra_ssh_keys   = [],
  $localtime_file        = '/usr/share/zoneinfo/Europe/Paris',
  $ntp_servers           = ['ntp.ovh.net'],
  $default_locale        = 'en_US.UTF-8',
  $available_locales     = ["en_US.UTF-8 UTF-8" ],
) {

  validate_array($available_locales)
  validate_array($ntp_servers)



  # declare all parameterized classes
  class { 'alkivi_base::params': }
  class { 'alkivi_base::config': }
  class { 'alkivi_base::scripts': }
  class { 'alkivi_base::users': }
  class { 'alkivi_base::install': }
  class { 'alkivi_base::service': }

  # declare relationships
  Class['alkivi_base::params'] ->
  Class['alkivi_base::install'] ->
  Class['alkivi_base::config'] -> 
  Class['alkivi_base::service']

  #Class['alkivi_base::scripts'] ->
  #Class['alkivi_base::users'] ->
}
