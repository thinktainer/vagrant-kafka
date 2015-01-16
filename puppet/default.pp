class hosts ($hosts = hiera_hash("hosts")) {
    create_resources('host', $hosts)
}

node /^zk\d{2}.*/ {

  include stdlib
  include epel
  include ::hosts
  include ::roles::kafkawebconsole

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

# kafka brokers
node /^kb(\d{2}).*/ {

  include epel
  include ::hosts

  class { 'selinux':
    mode => 'permissive'
  }

  class { 'kafka':
    broker_id         => '0',
    hostname          => $::ipaddress_eth1,
    zookeeper_connect => '192.168.55.1',
    package_url       => 'http://mirrors.ukfast.co.uk/sites/ftp.apache.org/kafka/0.8.2-beta/kafka_2.10-0.8.2-beta.tgz'
  }


}

