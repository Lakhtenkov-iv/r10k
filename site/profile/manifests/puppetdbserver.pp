class profile::puppetdbserver (
    String $puppetdb_host = 'puppetdb.example.lan',
    String $postgres_host = 'postgres.example.lan',
    String $database_username = 'puppetdb',
    String $database_password = 'puppetdb',
) { 
    class { 'puppetdb::server':
        database_host => $postgres_host,
        #database_username => $database_username,
        #database_password => $database_password,
        open_listen_port => true,
        open_ssl_listen_port => true,
        manage_firewall => true,
    }
    notify {"Password" :
      message =>  $database_password,
    } 
}
