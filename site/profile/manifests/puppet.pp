class profile::puppet (

) {
  class { 'hiera':
    hierarchy => [
      'nodes/%{::clientcert}',
      'locations/%{::location}',
      'environments/%{::applicationtier}',
      'common',
    ],
    datadir   => '/etc/puppetlabs/code/environments/%{::environment}/hieradata',
    eyaml     => true,
  }

}
