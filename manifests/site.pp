File { backup => false }
node default {
  if $::role {
    include "role::${role}"
  }
}

node puppet.mshome.net {
  include role::puppetmaster
  include role::base
}
