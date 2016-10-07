# == Class: multipathd
#
# === multipathd documentation
#
class multipathd(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits multipathd::params{

  class { '::multipathd::install': } ->
  class { '::multipathd::config': } ~>
  class { '::multipathd::service': } ->
  Class['::multipathd']

}
