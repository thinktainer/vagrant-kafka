node 'zookeeper.local.dev' {

  class { 'selinux':
    mode => 'permissive'
  }

  yumrepo { 'zookeeper':
    name          => 'bigtop',
    enabled       => true,
    ensure        => present,
    gpgcheck      => 0,
    repo_gpgcheck => 0,
    baseurl       => 'http://bigtop01.cloudera.org:8080/job/Bigtop-0.8.0/label=centos6//lastSuccessfulBuild/artifact/output/'
  }

  Class['selinux'] -> Yumrepo['zookeeper']

  class { 'zookeeper':
    packages             => ['zookeeper', 'zookeeper-server'],
    id                   => 1,
    client_port          => 2181,
    datastore            => '/var/lib/zookeeper',
    initialize_datastore => true,
    service_name         => 'zookeeper-server'
  }

   Yumrepo['zookeeper'] -> Class['zookeeper']
}

