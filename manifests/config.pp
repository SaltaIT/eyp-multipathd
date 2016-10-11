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
    content => template("${module_name}/multipathconf.erb")
  }

  concat::fragment { 'alias begin':
    target  => '/etc/multipath.conf',
    order   => '10',
    content => "\nmultipaths {\n",
  }

  concat::fragment { 'alias end':
    target  => '/etc/multipath.conf',
    order   => '19',
    content => "\n}\n",
  }

}
