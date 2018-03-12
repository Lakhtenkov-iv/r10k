class profile::puppetdatabase (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan'
) { 
   class { 'puppetdb::database::postgresql':
     listen_addresses => $postgres_host,
   } 
}
