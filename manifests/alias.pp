define multipathd::alias($wwid, $aliasname=$name) {

  concat::fragment { "alias ${wwid}":
    target  => '/etc/multipath.conf',
    order   => '11',
    content => template("${module_name}/alias.erb")
  }

}
