# == Class: multipathd
#
# === multipathd::install documentation
#
class multipathd::install inherits multipathd {

  if($multipathd::manage_package)
  {
    # package here, for example: 
    #package { $multipathd::params::package_name:
    #  ensure => $multipathd::package_ensure,
    #}
  }

}
