class rabbitmq::params {
  case $::osfamily {
        'redhat': {
          $supported  = true
          $package    = 'rabbitmq-server'
          $service    = 'rabbitmq-server'
          $config     = '/etc/rabbitmq/rabbitmq-env.conf'
          $template   = 'rabbitmq-env.erb'
        }
        default: {
          $supported = false
          notify { "${module_name}_unsupported":
            message => "The ${module_name} module is not support on ${::operatingsystem}",
          }
        }
      }
}
