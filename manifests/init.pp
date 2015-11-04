# == Class: pkgbuilder
#
# This class aims to act as a central place for including other classes
#
# === Parameters
#
# [*install_dir*]
#   Location where pkgbuilder will get installed.
#
# [*username*]
#   user under which pkgbuilder gets installed.
# [*public_ip*]
#   public_ip or dns name where the service is deployed
# [*public_port*]
#   public_port where the server is listening
#
#   
#
# === Authors
#
# Author Name <akash.agrawal1992@gmail.com>
#
# === Copyright
#
# Copyright 2015 Akash Agrawal, unless otherwise noted.
#
class pkgbuilder (
 $install_dir = '/usr/share',
 $username    = 'root',
 $public_ip   = '127.0.0.1',
 $public_port = '8080'
 
 ){
    include pkgbuilder::db
    include pkgbuilder::source
    include pkgbuilder::pythoninstall
    include pkgbuilder::dockerinstall
    include pkgbuilder::dbuildinstall
    include pkgbuilder::migrate
    include pkgbuilder::runserver
}
