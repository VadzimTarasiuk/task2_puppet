class apache {
  case $facts['osfamily'] {
    'CentOS', 'RedHat': {
      package { 'httpd':
        ensure=>'installed',
      }
      file { '/var/www/html/index.html':
        ensure  => file,
        content => template('apache/index.html.epp'),
        # Loads /etc/puppetlabs/code/environments/production/modules/apache/templates/index.html.epp
      }
      notify { 'httpd is installed.':
      }
      service { 'httpd':
        ensure=>'running',
      }
      notify { 'httpd is running.':
      }
    }
    'Debian', 'Ubuntu': {
      package { 'apache2': 
        ensure => installed,
      }
      file { '/var/www/html/index.html':
        ensure  => file,
        content => template('apache/index.html.epp'),
        # Loads /etc/puppetlabs/code/environments/production/modules/apache/templates/index.html.epp
      }
      notify { 'apache2 is installed.':
      }
      service { 'apache2':
        ensure=>'running',
      }
      notify { 'apache2 is running.':
      }
    }
    default: {
      notify { 'You dont have such node.':
      }
    }
  }
}

