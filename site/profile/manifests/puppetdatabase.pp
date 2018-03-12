class profile::puppetdatabase (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan'
) { 
    class { 'puppetdb::master::config':
        puppetdb_server => $puppetdb_host,
    }
    
}
