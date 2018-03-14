class role::puppetdbserver {
  include profile::base
  include profile::consul
  include profile::puppetdbserver
}
