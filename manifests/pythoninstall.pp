# == Class: pkgbuilder::pythoninstall
#
# This class is used for installation of python using puppet python module
# ==


class pkgbuilder::pythoninstall {
 class { 'python':
 version      => 'system',
 dev          => true,
 virtualenv   => true,
      }


 package { "libmysqlclient-dev": 
 ensure       => installed, 
       }


 python::virtualenv { "${pkgbuilder::install_dir}/pkgbuilder/venv":
 ensure       => present,
 version      => 'system',
 systempkgs   => false,
 distribute   => true,
 requirements => "${pkgbuilder::install_dir}/pkgbuilder/requirements.txt",
 owner        => "${pkgbuilder::username}",
 require      => [Package['libmysqlclient-dev'],Class['python'],Class["pkgbuilder::source"]],
 
	}
}
