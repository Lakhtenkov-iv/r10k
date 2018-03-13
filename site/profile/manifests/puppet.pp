class profile::puppet (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan'
) {
  class { 'hiera':
    hiera_version => '5',
    hiera5_defaults =>  {"datadir" => "/etc/puppetlabs/code/environments/%{environment}/hieradata", "data_hash" => "yaml_data"},
    hierarchy       =>  [
                          {"name" =>  "Basic Hierarchy", "paths" =>  ['roles/%{facts.role}.yaml', 'nodes/%{::clientcert}.yaml', 'environments/%{::applicationtier}.yaml']},
                          {"name" =>  "Default yaml file", "path" =>  "common.yaml"},
                        ],
    eyaml => true,
    eyaml_extension => 'yaml',
  }
  class { 'puppetdb::master::config':
      puppetdb_server => $puppetdb_host,
  }

}
