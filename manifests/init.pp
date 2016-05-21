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
    'ensure'  => 'present',
    'require' => Class['apt::update']
  } )

  # mime-types gem (mailcatcher dep) : we enforce this 'old' version to need Ruby < 2
  ensure_packages ( 'gem-mime-types', {
    'ensure'   => '2.99.1',
    'name'     => 'mime-types',
    'provider' => 'gem',
    'require'  => Package['make','ruby-dev','libsqlite3-dev']
  } )
  # mail gem (mailcatcher dep) : we enforce this 'old' version to need Ruby < 2
  ensure_packages ( 'gem-mail', {
    'ensure'   => '2.6.3',
    'name'     => 'mail',
    'provider' => 'gem',
    'require'  => Package['make','ruby-dev','libsqlite3-dev','gem-mime-types']
  } )
  # Install mailcatcher gem
  ensure_packages ( 'mailcatcher', {
    'ensure'          => $ensure ? {
      /(installed|present)/ => $version,
      default               => absent
    },
    'provider'        => 'gem',
    'install_options' => '--conservative',
    'require'         => Package['make','ruby-dev','libsqlite3-dev','gem-mime-types','gem-mail']
  } )

}
