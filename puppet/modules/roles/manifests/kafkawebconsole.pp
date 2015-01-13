class roles::kafkawebconsole (){

  contain ::profiles::play

  vcsrepo { 'webconsole-repo':
    path     => "/home/$play::user/kafka-web-console",
    ensure   => present,
    provider => git,
    source   => "https://github.com/claudemamo/kafka-web-console.git",
    owner    => $play::user,
    require  => User[$play::user]
  }

  play::application { 'kafka-web-console':
    ensure      => running,
    path        => "/home/$play::user/kafka-web-console",
    java_options => '-DapplyEvolutions.default=true',
    require     => [Vcsrepo['webconsole-repo'], Class["::profiles::play"]],
  }

}
