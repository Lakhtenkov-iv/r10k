class role::app_server {

  stage { 'prerequisites' :
    before => stage ['main'],
  }

  stage { 'configure_web_server' : }
  stage { 'configure_web_server' : }

  class { 'profile::base' :
    stage => prerequisites
  }

  include profile::base
}
