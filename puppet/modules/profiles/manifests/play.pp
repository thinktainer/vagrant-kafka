class profiles::play {
  package {'upstart':
    ensure => installed
  }
  contain ::play
}
