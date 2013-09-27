# quickstack storage class
class example::storage {

  class { 'gluster::server': }

  volume { 'glance':
    ensure         => present,
    path           => '/srv/gluster/glance',
    peers          => [ '192.168.0.2', '192.168.0.3', '192.168.0.4' ],
    replica_count  => '3',
  }

  volume { 'cinder':
    ensure         => present,
    path           => '/srv/gluster/cinder',
    peers          => [ '192.168.0.2', '192.168.0.3', '192.168.0.4' ],
    replica_count  => '3',
  }

  volume { 'swift':
    ensure         => present,
    path           => '/srv/gluster/swift',
    peers          => [ '192.168.0.2', '192.168.0.3', '192.168.0.4' ],
    replica_count  => '3',
  }
}
