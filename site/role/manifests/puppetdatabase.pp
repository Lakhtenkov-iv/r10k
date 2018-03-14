class role::puppetdatabase {
  include profile::base
  include profile::consul
  include profile::puppetdatabase
}
