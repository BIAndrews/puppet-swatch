# == Class swatch::params
#
# This class is meant to be called from swatch.
# It sets variables according to platform.
#
class swatch::params {

  $version        = 'latest'
  $service_enable = true
  $service_ensure = 'running'
  $conf_dir       = '/etc/swatch.d'

  case $::osfamily {
    'Debian': {
      $package_name = 'swatch'
      $service_name = 'swatch'
    }
    'RedHat', 'Amazon': {
      $package_name = 'swatch'
      $service_name = 'swatch'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
