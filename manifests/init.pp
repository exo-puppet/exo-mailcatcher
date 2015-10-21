class mailcatcher (
  $ensure  = 'present',
  $version = '0.6.1') {
  # Parameters validation
  validate_re($ensure, '(installed|present|absent)')
  # Install dependencies
  ensure_packages([
    'make',
    'ruby-dev',
    'libsqlite3-dev'], {
    'ensure' => 'present'
  }
  )

  # Install mailcatcher gem
  package { 'mailcatcher':
    ensure   => $ensure ? {
      /(installed|present)/ => $version,
      default               => absent
    },
    provider => gem,
    require  => Package[
      'make', 'ruby-dev', 'libsqlite3-dev']
  }

}
