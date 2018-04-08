# == Class swatch::config
#
# This class is called from swatch for service config.
#
class swatch::config {

  # conf dir
  file { $::swatch::conf_dir:
    ensure => directory,
  }

  # init script
  if $::swatch::service_name {
    # this should fail if the service name is false or blank
    file { "/etc/init.d/${::swatch::service_name}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0775',
      content => template('swatch/init.sh.erb'),
      notify  => Service[$::swatch::service_name],
    }
  }

  create_resources(swatch::generate_swatch_configs, $::swatch::conf)


}
