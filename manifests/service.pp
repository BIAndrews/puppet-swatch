# == Class swatch::service
#
# This class is meant to be called from swatch.
# It ensure the service is running.
#
class swatch::service {

  service { $::swatch::service_name:
    ensure  => $::swatch::service_ensure,
    enable  => $::swatch::service_enable,
    require => Package[$::swatch::package_name],
  }

}
