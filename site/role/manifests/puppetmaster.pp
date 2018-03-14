class role::puppetmaster {
  include profile::base
  include profile::puppet
  include profile::consulbootstrapserver
}
