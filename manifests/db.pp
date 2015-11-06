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
 $db_rootuser     = 'root',
 $db_rootpassword = 'root',
 $db_name         = 'pkgbuilder',
 $db_username     = 'pkgbuilder',
 $db_password     = 'change3M3',

 ){

  exec {"check_presence .my.cnf":
  command => '/bin/true',
  path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
  onlyif => '/usr/bin/test -e /root/.my.cnf',
 
  }

 mysql::db { "${db_name}":
  user     => "${db_username}",
  password => "${db_password}",
  host     => 'localhost',
  grant    => ['ALL'],
  require  => Exec["check_presence .my.cnf"],
  }

}


