class profile::consulservice (
  String $service_name = 'service1',
  String $address = $facts.ipaddress,
  String $port = '8080',
  String $url = 'http://localhost:42/status',
) {
  ::consul::service { $service_name:
    address => $address,
    checks  => [
      {
        http     => $url,
        interval => '10s'
      }
    ],
    port    => $port,
    tags    => ['test']
  } 
}
