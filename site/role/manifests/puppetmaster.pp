class role::puppetmaster {
  include profile::base
  include profile::consul
  include profile::puppet
}
