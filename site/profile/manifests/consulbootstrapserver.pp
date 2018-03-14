class profile::consulbootstrapserver (
  String $version = '1.0.6'
  String $datacenter = 'ilakhtenkov'
) {
  class { '::consul':
    version => $version
  
    config_hash => {
      'bootstrap'        => true,
      'data_dir'         => '/opt/consul',
      'datacenter'       => '${datacenter}',
      'log_level'        => 'INFO',
      'node_name'        => '${::fqdn}',
      'server'           => true,
    }
  }
}

