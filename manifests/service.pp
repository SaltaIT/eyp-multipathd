class multipathd::service inherits multipathd {

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  validate_bool($multipathd::manage_docker_service)
  validate_bool($multipathd::manage_service)
  validate_bool($multipathd::service_enable)

  validate_re($multipathd::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${multipathd::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $multipathd::manage_docker_service)
  {
    if($multipathd::manage_service)
    {
      service { 'multipathd':
        ensure => $service_ensure,
        enable => $service_enable,
      }

      exec { 'enable multupath DM driver':
        command => '/sbin/mpathconf --enable',
        onlyif  => 'multipath -v3 | grep "DM multipath kernel driver not loaded"',
        before  => Service['multipathd'],
      }
    }
  }
}
