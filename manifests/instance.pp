define mailcatcher::instance (
  $ensure    = 'running',
  $smtp_ip   = '127.0.0.1',
  $smtp_port = 1025,
  $http_ip   = '127.0.0.1',
  $http_port = 1080) {
  # Parameters validation
  validate_re($ensure, '(absent|running|stopped)')

  # Service file
  file { "mailcatcher-${name}":
    ensure  => $ensure ? {
      'absent' => 'absent',
      default  => 'present'
    },
    path    => "/etc/init/mailcatcher-${name}.conf",
    owner   => root,
    group   => root,
    content => template('mailcatcher/mailcatcher.conf.erb')
  }

  service { "mailcatcher-${name}":
    ensure  => $ensure ? {
      'absent' => 'stopped',
      default  => $ensure
    },
    name    => "mailcatcher-${name}",
    require => File["mailcatcher-${name}"]
  }
}
