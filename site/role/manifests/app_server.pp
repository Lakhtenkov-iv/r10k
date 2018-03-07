class role::app_server {

  stage { 'prerequisites' :
    before => stage ['main'],
  }

  stage { 'configure_web_server' : }
  stage { 'third_config' : }

  class { 'profile::base' :
    stage => prerequisites
  }

  Stage['main'] ->  Stage ['configure_web_server']
  Stage['configure_web_server'] ->  Stage ['third_config']

  include profile::base
}
