class profile::puppet (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan'
) {
  class { 'hiera':
    hierarchy => [
      'nodes/%{::clientcert}',
      'roles/%{::role}',
      'environments/%{::applicationtier}',
      'common',
    ],
    datadir   => '/etc/puppetlabs/code/environments/%{::environment}/hieradata',
    eyaml     => true,
  }
  class { 'puppetdb::master::config':
      puppetdb_server => $puppetdb_host,
  }

}
