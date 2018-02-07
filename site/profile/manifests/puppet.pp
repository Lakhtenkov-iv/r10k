class profile::puppetmaster (

) {
  class { 'hiera':
    hierarchy            => [
      'nodes/%{::clientcert}',
      'locations/%{::location}',
      'environments/%{::applicationtier}',
      'common',
    ],
    eyaml                => true,
  }

}
