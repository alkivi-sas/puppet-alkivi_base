class alkivi_base () {
  # Some scripts
  class { 'alkivi_base::scripts': }

  # Alkivi iptables services
  service { 'alkivi-iptables':
    hasrestart => true,
    hasstatus  => false,
    status     => 'iptables -L -n',
    restart    => '/etc/init.d/alkivi-iptables restart',
  }
}
