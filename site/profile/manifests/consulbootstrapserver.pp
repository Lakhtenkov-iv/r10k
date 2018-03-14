class profile::consulbootstrapserver (
  String $version = '1.0.6'
) {
  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'data_dir'         => '/var/consul',
      'datacenter'       => 'datacenter',
      'log_level'        => 'INFO',
      'node_name'        => '$::fqdn',
      'server'           => true,
      'version'          => $version
    }
  }
}

