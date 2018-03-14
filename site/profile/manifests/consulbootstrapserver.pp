class profile::consulbootstrapserver (

) {
  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'data_dir'         => '/var/consul',
      'datacenter'       => 'datacenter',
      'log_level'        => 'INFO',
      'node_name'        => '$::fqdn',
      'server'           => true,
    }
  }
}

