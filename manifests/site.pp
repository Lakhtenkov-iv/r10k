File { backup => false }
node default {
}
hiera_include('classes')
#node puppet.mshome.net {
#  include role::puppetmaster
#}
