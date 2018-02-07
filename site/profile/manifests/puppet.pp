class profile::puppet (

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

}
