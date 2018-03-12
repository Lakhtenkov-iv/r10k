class profile::puppetdbserver (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan'
) { 
    class { 'puppetdb::server':
        database_host => $postgres_host,
        manage_firewall => true,
    } 
}
