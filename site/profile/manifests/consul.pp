class profile::consul (
  String $version = '1.0.6',
  String $datacenter = 'ilakhtenkov',
  String $datadir = '/opt/consul',
  String $consule_key = undef,
  String $node_name = $::fqdn,
  String $ui_listen_host = '0.0.0.0'
  Boolean $ui_install = false,
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
        'ui'               => $ui_install,
        'client_addr'      => $ui_listen_host,
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
        'encrypt'          => $consule_key,
      }
    }
  }
  
}

