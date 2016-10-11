# == Class: multipathd
#
# === multipathd::config documentation
#
class multipathd::config inherits multipathd {

  concat { '/etc/multipath.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[$multipathd::params::package_name],
    notify  => Class['multipathd::service'],
  }

  concat::fragment { 'base multipathcobnf':
    target  => '/etc/multipath.conf',
    order   => '00',
    content => template("${module_name}/multipathdconf.erb")
  }

}
