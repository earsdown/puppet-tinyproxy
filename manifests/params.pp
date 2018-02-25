# == Class tinyproxy::params
#
# Settings class
#
# === Parameters
#
# None
#
class tinyproxy::params {
  $autoupgrade = false
  $package = 'tinyproxy'
  $service = 'tinyproxy'
  $hasstatus = false
  $hasrestart = true
  $listen = undef
  $bind = undef
  $bindsame = undef
  $connection_timeout = 600
  $allow = []
  $errorfiles = {}
  $defaulterrorfile = '/usr/share/tinyproxy/default.html'
  $debugerrorfile = '/usr/share/tinyproxy/debug.html'
  $debugmode = false
  $stathost = undef
  $statfile = '/usr/share/tinyproxy/stats.html'
  $logfile = '/var/log/tinyproxy/tinyproxy.log'
  $syslog = false
  $log_level = 'Info'
  $pidfile = '/var/run/tinyproxy/tinyproxy.pid'
  $xtinyproxy = undef
  $maxclients = 100
  $minspareservers = 5
  $maxspareservers = 20
  $startservers = 10
  $maxrequestsperchild = 0
  $viaproxyname = 'tinyproxy'
  $disableviaheader = undef
  $filter = undef
  $filtercontent = undef
  $filterurls = undef
  $filterextended = undef
  $filtercasesensitive = undef
  $filterdefaultdeny = undef
  $anonymous = []
  $connectport = []
  $reverseonly = undef
  $reversemagic = undef
  $reversebaseurl = undef

  case $::osfamily {
    'RedHat':{
      $configfile = '/etc/tinyproxy/tinyproxy.conf'
      $user = 'tinyproxy'
      $group = 'tinyproxy'
      $port = 8888
    }
    'Debian':{
      if versioncmp($::lsbmajdistrelease, '9') >= 0 {
        $configfile = '/etc/tinyproxy/tinyproxy.conf'
        $user = 'tinyproxy'
        $group = 'tinyproxy'
        $port = 8888
      } else {
        $configfile = '/etc/tinyproxy.conf'
        $user = 'nobody'
        $group = 'nogroup'
        $port = 3128
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}, lsbdistcodename: ${::lsbdistcodename}")
    }
  }
}
