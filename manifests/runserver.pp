
# == Class: pkgbuilder::runserver
#
# This class is used to make sure server is running
# ==

class pkgbuilder::runserver {

 exec { 'runserver':
  cwd          => "${pkgbuilder::install_dir}/pkgbuilder",
  provider     => shell,
  user         => "${pkgbuilder::username}",
  command      => "bash runserver.sh",
  refreshonly  => false,
  require      => [Class["pkgbuilder::migrate"],File["${pkgbuilder::install_dir}/pkgbuilder/runserver.sh"]],
 	}
  file { "${pkgbuilder::install_dir}/pkgbuilder/runserver.sh":
  ensure       => file,
  content      => template('pkgbuilder/runserver.sh.erb'),
  require      => [Class["pkgbuilder::migrate"]],
        }

}
