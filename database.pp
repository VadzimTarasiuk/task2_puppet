class database {
  mysql::db { 'test_mdb':
    user     => 'test_user',
    password => 'vagrant',
    dbname   => 'test_mdb',
    grant    => ['SELECT', 'UPDATE'],
  }  
}

