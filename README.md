#### Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with swatch](#setup)
    * [What swatch affects](#what-swatch-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Installs and configures the old swatch utility. Init script included for daemon support.

## Setup

### What swatch affects

* `/etc/init.d/swatch` - init script.
* `/etc/swatch.d/` - config directory.

### Setup Requirements

EPEL is needed in CentOS/RHEL for the swatch package. Swatch is a perl script.

## Usage

Swatch (Hash) conf example:

~~~
class { '::swatch':
  conf => {
    'apacheStartup' => { 
      'filewatch' => '/var/log/httpd/error_log',
      'content'   => "watchfor /Apache.* configured -- resuming normal operations/\n\texec /bin/logger 'apache startup detected'" 
    },
    'sudoRoot' => { 
      'filewatch' => '/var/log/secure',
      'content'   => "watchfor /sudo: (.*) :.* USER=root .*/\n\texec /bin/logger 'sudo to root by \$1'" 
    } 
  }
}
~~~

## Reference

### Classes

#### Public classes
* `swatch`: Installs and configures swatch.

#### Private classes
* `swatch::params`: Auto detection of package names based on OS family.
* `swatch::install`: Package installation.
* `swatch::config`: Init script and config files.
* `swatch::service`: Service management. 

## Limitations

Linux only support.
