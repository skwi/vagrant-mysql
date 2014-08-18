node 'mysql.box' {

    exec { 'apt-get update':
        path => '/usr/bin',
    }

    class { '::mysql::server':
        root_password    => 'azerty',
        override_options => {
            'mysqld' => {
                'max_connections'       => '1024',
                'bind-address'          => '0.0.0.0',
                'skip-external-locking' => true,
            }
        },
    }

    mysql::db { 'test':
        user     => 'test',
        password => 'azerty',
        host     => '%',
        grant    => ['ALL'],
    }
}