class profile::puppetdatabase (
    $puppetdb_host = 'puppetdb.example.lan'
    $postgres_host = 'postgres.example.lan'
) { 
    class { 'puppetdb::master::config':
        puppetdb_server => $puppetdb_host,
    }
    
}
