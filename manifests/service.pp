class alkivi_base::service () {
  service { 'networking':
    hasrestart => true,
  }

  service { 'alkivi-iptables':
    hasrestart => true,
    hasstatus  => false,
    status     => 'iptables -L',
    restart    => '/etc/init.d/alkivi-iptables restart',
  }
}

