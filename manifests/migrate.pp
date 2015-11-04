
# == Class: pkgbuilder::migrate
#
# This class is used to for running migrations
# ==

class pkgbuilder::migrate {

exec { 'migrate':
 cwd => "${pkgbuilder::install_dir}/pkgbuilder",
 provider => shell,
 user => "${pkgbuilder::username}",
 command => ". venv/bin/activate && python manage.py migrate",
 refreshonly => false,
 require => [Class["pkgbuilder::db"],Class["pkgbuilder::dbuildinstall"],Class["pkgbuilder::pythoninstall"]],
 }

}
