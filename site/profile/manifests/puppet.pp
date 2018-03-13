class profile::puppet (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan',
    String $puppet_conf_dir = '/etc/puppetlabs/puppet',
    String $puppet_user = 'puppet',
    String $puppet_user_group  = 'puppet'
) {
  class { 'hiera':
    hiera_version => '5',
    hiera5_defaults =>  {"datadir" => "/etc/puppetlabs/code/environments/%{environment}/hieradata", "data_hash" => "yaml_data"},
    hierarchy       =>  [
                          {"name" =>  "Basic Hierarchy", 
                           "paths" =>  ['roles/%{facts.role}.eyaml', 'nodes/%{::clientcert}.eyaml'],
                           "lookup_key" => "eyaml_lookup_key", 
                           "options" => {"pkcs7_private_key" => "$puppet_conf_dir/keys/private_key.pkcs7.pem", "pkcs7_public_key" => "$puppet_conf_dir/keys/public_key.pkcs7.pem" }},
                          {"name" =>  "Default yaml file", "path" =>  "common.yaml"},
                        ],
    
    #eyaml => true,
    #keysdir => '/etc/puppetlabs/puppet/keys'
  }

  file { $puppet_conf_dir:
    ensure => directory,
    owner => $puppet_user,
    group => $puppet_user_group
    
  }
  class { 'puppetdb::master::config':
    puppetdb_server => $puppetdb_host,
  }

}
