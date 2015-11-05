
# == Class: pkgbuilder::scripts
#
# This class is used to relevent scripts in desired folders
# ==

class pkgbuilder::scripts {
  require pkgbuilder::migrate
  
  file { "${pkgbuilder::log_dir}":
  ensure       => directory,
  group        => "${pkgbuilder::group}",
  mode         => '0770',
        
       }

  file { "${pkgbuilder::install_dir}/pkgbuilder/start.sh":
  ensure       => file,
  content      => template('pkgbuilder/start.sh.erb'),
  mode         => 744,
        }
  file { "${pkgbuilder::install_dir}/pkgbuilder/stop.sh":
  ensure       => file,
  content      => template('pkgbuilder/stop.sh.erb'),
  mode         => 744,
        }

  file { "${pkgbuilder::install_dir}/pkgbuilder/celerystart.sh":
  ensure       => file,
  content      => template('pkgbuilder/celerystart.sh.erb'),
  mode         => 744,
        }

  file { "${pkgbuilder::install_dir}/pkgbuilder/celerystop.sh":
  ensure       => file,
  content      => template('pkgbuilder/celerystop.sh.erb'),
  mode         => 744,
        }

  file { "/etc/init.d/pkgbuilder":
  ensure       => file,
  content      => template('pkgbuilder/pkgbuilder.erb'),
  mode         => 744,
        }

  file { "/etc/init.d/pkgbuilder-celery":
  ensure       => file,
  content      => template('pkgbuilder/pkgbuilder-celery.erb'),
  mode         => 744,
        }

}
