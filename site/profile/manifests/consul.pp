class profile::consul (
  String $version = '1.0.6',
  String $datacenter = 'ilakhtenkov',
  String $datadir = '/opt/consul',
  String $consule_key = undef,
  String $node_name = $::fqdn,
  Boolean $server = false,
  Boolean $bootstrap = false,
  Array $consul_servers = [
    'master.mshome.net',
  ],
) {
  if $server {
    class { '::consul':
      version => $version,
      config_hash => {
        'bootstrap'        => $bootstrap,
        'data_dir'         => $datadir,
        'datacenter'       => $datacenter,
        'log_level'        => 'INFO',
        'node_name'        => $node_name,
        'server'           => true,
        'encrypt'          => $consule_key,
      }
    }
  } else {
    class { '::consul':
      version => $version,
      config_hash => {
        'data_dir'   => $datadir,
        'datacenter' => $datacenter,
        'log_level'  => 'INFO',
        'node_name'  => $::fqdn,
        'retry_join' => $consul_servers,
      }
    }
  }
  
}

