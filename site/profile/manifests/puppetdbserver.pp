class profile::puppetdbserver (
    $puppetdb_host = 'puppetdb.example.lan'
    $postgres_host = 'postgres.example.lan'
) { 
    class { 'puppetdb::server':
        database_host => $postgres_host,
    } 
}
