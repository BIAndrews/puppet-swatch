# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
#
class { '::swatch':

  service_ensure => 'stopped',
  conf_dir       => '/tmp/swatch.d',

  conf => {
    'apacheStartup' => {
      'filewatch' => '/var/log/httpd/error_log',
      'content'   => "watchfor /Apache.* configured -- resuming normal operations/\n\texec /bin/logger 'apache startup detected'",
    },
    'sudoRoot' => {
      'filewatch' => '/var/log/secure',
      'content'   => "watchfor /sudo: (.*) :.* USER=root .*/\n\texec /bin/logger 'sudo to root by \$1'",
    },
  },

}
