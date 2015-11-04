# == Class: pkgbuilder::source
#
# This class is used for getting the source code of pkgbuilder and installing it
# ==
# [*sourcerepo*]
#   source repo for pkgbuilder code

class pkgbuilder::source (
 $sourcerepo      = 'https://github.com/aasemble/python-aasemble.django',
 $db_rootuser     = $pkgbuilder::db::db_rootuser,
 $db_rootpassword = $pkgbuilder::db::db_rootpassword,
 $db_name         = $pkgbuilder::db::db_name,
 $db_username     = $pkgbuilder::db::db_username,
 $db_password     = $pkgbuilder::db::db_password,
){
  exec { "apt-get update":
    command       => "/usr/bin/apt-get update",
    logoutput     => on_failure,
  }
  package { "git": 
    ensure        => installed, 
    require       => Exec['apt-get update'], 
  }
    
  package { "reprepro": 
    ensure        => installed, 
  }

  vcsrepo { "${pkgbuilder::install_dir}/pkgbuilder":
    ensure        => present,
    provider      => git,
    source        => "${sourcerepo}",
    revision      => "master",
    user          => "${pkgbuilder::username}",
    require       => [Package["git"],Package["reprepro"],Class["pkgbuilder::db"]],
 
  }	

  file { "${pkgbuilder::install_dir}/pkgbuilder/test_project/settings.py":
    ensure        => file,
    content       => template('pkgbuilder/settings.py.erb'),
    require       => Vcsrepo["${pkgbuilder::install_dir}/pkgbuilder"],
  }
}


