File { backup => false }
node default {
  #if $::role {
    include "role::${role}"
  #}
}
