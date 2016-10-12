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
                            $user_friendly_names   = true,
                            $blacklist             =  [
                                                        '^(asm|ram|raw|loop|fd|md|dm-|sr|scd|st)[0-9]*',
                                                        '^hd[a-z]',
                                                        '^xvd[a-z]',
                                                        '^cciss*',
                                                        ],
                          ) inherits multipathd::params{

  class { '::multipathd::install': } ->
  class { '::multipathd::config': } ~>
  class { '::multipathd::service': } ->
  Class['::multipathd']

}
