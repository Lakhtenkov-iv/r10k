File { backup => false }
node default {
  include role::%{::role}
}
