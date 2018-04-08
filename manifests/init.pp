# Class: swatch
# ===========================
#
class swatch (

  $conf,
  $package_name   = $::swatch::params::package_name,
  $service_name   = $::swatch::params::service_name,
  $service_enable = $::swatch::params::service_enable,
  $service_ensure = $::swatch::params::service_ensure,
  $version        = $::swatch::params::version,
  $conf_dir       = $::swatch::params::conf_dir,

) inherits ::swatch::params {

  class { '::swatch::install': } ->  class { '::swatch::config': } ~>  class { '::swatch::service': } ->  Class['::swatch']

}
