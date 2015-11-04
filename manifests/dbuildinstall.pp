# == Class: pkgbuilder::dbuildinstall
#
# This class is used for installation of dbuild library
# ==
# [*dbuildsource*]
#   source repo for python dbuild

class pkgbuilder::dbuildinstall (
 $dbuildsource = 'https://github.com/hkumarmk/python-dbuild'

 ){
exec { 'Install python-dbuild':
 cwd => "${pkgbuilder::install_dir}/pkgbuilder",
 provider => shell,
 user => "${pkgbuilder::username}",
 command => ". venv/bin/activate && pip install -e 'git+${dbuildsource}@master#egg=Package'",
 refreshonly => false,
 require => [Class["pkgbuilder::dockerinstall"],Class["pkgbuilder::pythoninstall"]],
 }

}
