# == Class: multipathd
#
# === multipathd::install documentation
#
class multipathd::install inherits multipathd {

  if($multipathd::manage_package)
  {
    package { $multipathd::params::package_name:
      ensure => $multipathd::package_ensure,
    }
  }

}
