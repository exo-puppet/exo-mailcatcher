# exo-mailcatcher

A Puppet module to install and deploy 1 or several instances of MailCatcher (http://mailcatcher.me/)

## Usage

Declare and install Mailcatcher

~~~
include mailcatcher
~~~

Configure and launch mailcatcher with the default settings

~~~
mailcatcher::instance { 'mailcatcher':}
~~~

Configure and launch mailcatcher with particular settings

~~~
mailcatcher::instance { 'mailcatcher':
  smtp_ip   => '127.0.0.1',
  smtp_port => 1081,
  http_ip   => '0.0.0.0',
  http_port => 8081
}
~~~

Configure mailcatcher but keep the service stopped

~~~
mailcatcher::instance { 'mailcatcher':
  ensure    => 'stopped',
  smtp_ip   => '127.0.0.1',
  smtp_port => 1081,
  http_ip   => '0.0.0.0',
  http_port => 8081
}
~~~

Uninstall a previously installed instance of mailcatcher service

~~~
mailcatcher::instance { 'mailcatcher':
  ensure    => 'absent',
  smtp_ip   => '127.0.0.1',
  smtp_port => 1081,
  http_ip   => '0.0.0.0',
  http_port => 8081
}
~~~

## Contact

eXo platform - Software Factory Team
mailto : <exo-swf@exoplatform.com>

## Support

Please log tickets and issues at our [Projects site](https://github.com/exo-puppet/exo-mailcatcher)
