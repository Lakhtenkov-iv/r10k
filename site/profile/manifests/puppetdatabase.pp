class profile::puppetdatabase (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan',
    String $database_username = 'puppetdb',
    String $database_password = 'puppetdb',
) { 
   stage { 'first':
     before => Stage['main'],
   }
   stage { 'last': }
   Stage['main'] -> Stage['last']
  
   class { 'puppetdb::database::postgresql':
     stage => first,
     listen_addresses => $postgres_host,
     database_username => $database_username,
     database_password => $database_password,
   }
   class { '::postgresql::server':
     stage => last,
     datadir => '/data',
   }
    
}


