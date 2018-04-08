# define swatch::generate_swatch_configs
define swatch::generate_swatch_configs (
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
