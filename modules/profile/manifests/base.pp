class profile::base(
  Array $ntp_servers = [
    '0.europe.pool.ntp.org',
    '1.europe.pool.ntp.org',
    '2.europe.pool.ntp.org',
    '3.europe.pool.ntp.org'
  ],
  String $timezone = 'UTC',
) {
  class { 'timezone':
    timezone => $timezone,
  }
  class { 'ntp':
    servers => $ntp_servers,
  }
}
