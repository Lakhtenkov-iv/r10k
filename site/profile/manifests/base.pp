class profile::base(
  Array $ntp_servers = [
    '0.europe.pool.ntp.org',
    '1.europe.pool.ntp.org',
    '2.europe.pool.ntp.org',
    '3.europe.pool.ntp.org'
  ],
  String $timezone = 'UTC',
  String $teststring = 'test string',
) {
  class { 'timezone':
    timezone => $timezone,
  }
  class { 'ntp':
    servers => $ntp_servers,
  }
  
  file { '/testfile': 
    ensure => present,
    content => $testsrting,
  }
  $packages = hiera_hash('packages',{})
  create_resources(package, $packages)
}
