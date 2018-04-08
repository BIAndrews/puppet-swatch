# == Class swatch::config
#
# This class is called from swatch for service config.
#
class swatch::config {

  #
  # define used to create multiple files
  #

  define generate_swatch_configs (
    $filewatch,
    $content,
    $ensure = file,
  ) {
    file { "${::swatch::conf_dir}/${title}":
      ensure  => $ensure,
      content => $content,
      notify  => Service[$::swatch::service_name],
      require => File[$::swatch::conf_dir],
    }
  }

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

  create_resources(swatch::config::generate_swatch_configs, $::swatch::conf)


}
