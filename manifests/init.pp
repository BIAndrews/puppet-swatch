# Class: swatch
# ===========================
#
# Full description of class swatch here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class swatch (

  $package_name   = $::swatch::params::package_name,
  $service_name   = $::swatch::params::service_name,
  $service_enable = $::swatch::params::service_enable,
  $service_ensure = $::swatch::params::service_ensure,
  $version        = $::swatch::params::version,
  $conf_dir       = $::swatch::params::conf_dir,
  $conf,

) inherits ::swatch::params {

  # validate parameters here

  class { '::swatch::install': } ->
  class { '::swatch::config': } ~>
  class { '::swatch::service': } ->
  Class['::swatch']
}
