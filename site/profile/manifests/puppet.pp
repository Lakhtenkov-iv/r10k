class profile::puppet (
    $puppetdb_host = 'puppetdb.example.lan'
    $postgres_host = 'postgres.example.lan'
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
