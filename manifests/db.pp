# == Class: pkgbuilder::db
#
# This class is used to create database for pkgbuilder along with user 
# and password. Parameters come from init.pp
# ==
# === Parameters
# [*db_rootuser*]
#   root user for database which pkgbuilder uses
#
# [*db_rootpassword*]
#
#   root password for database which pkgbuilder uses
# [*db_name*]
#   name of the database
#
# [*db_username*]
#   username with which code will connect to database
#
# [*db_password*]
#   password with which code will connect to database
#

class pkgbuilder::db  (
 $db_rootuser = 'root',
 $db_rootpassword = 'root',
 $db_name = 'pkgbuilder',
 $db_username = 'pkgbuilder',
 $db_password = 'change3M3',

 ){
    service { "mysql":
    enable => true,
    ensure => running,
  }

    mysqldb { "${db_name}":
        user => "${db_username}",
        password => "${db_password}",
    }
}


define mysqldb( $user, $password ) {
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      command => "/usr/bin/mysql -u${db_rootuser} -p${db_rootpassword} -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysql"],
    }
  }
