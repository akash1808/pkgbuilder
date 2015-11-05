# == Class: pkgbuilder::createuser
#
# This class is used for installation of docker using puppet module docker
# ==


class pkgbuilder::createuser {
  
 group {"${pkgbuilder::group}":
   ensure     => present,
  }

  user { "${pkgbuilder::username}":
   ensure     => present,
   gid        => "${pkgbuilder::group}",
   managehome => true,
   require    => Group["${pkgbuilder::group}"],
   }
}



