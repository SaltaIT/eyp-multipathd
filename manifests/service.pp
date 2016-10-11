class multipathd::service inherits multipathd {

  #
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
    }
  }
}
