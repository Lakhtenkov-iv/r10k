File { backup => false }
node default {
  include role::%{facts.role}
}
