class alkivi_base::install () {

  # We want to install lots of defaut packages
  Package { ensure => installed }

  $alkivi_base_packages = [
    'alkivi-iptables',
    'mosh',
    'exuberant-ctags',
    'git',
    'zip',
    'sharutils',
    'libjson-perl',
    'perl-modules',
    'smartmontools',
    'nload',
    'ca-certificates',
    'usbutils',
    'htop',
    'multitail',
    'kexec-tools',
    'tzdata',
    'coreutils',
    'python-pip',
    'locate',
    'smbclient',
  ]

  package { $alkivi_base_packages: }
}
