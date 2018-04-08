# == Class swatch::install
#
# This class is called from swatch for install.
#
class swatch::install {

  package { $::swatch::package_name:
    ensure => $::swatch::package_version,
  }

}
