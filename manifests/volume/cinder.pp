# provide GlusterFS Cinder volume
class gluster::volume::cinder {

   class { 'gluster::server': }

   volume { 'cinder':
     ensure         => present,
     path           => '/srv/gluster/cinder',
     peers          => [ '192.168.0.2', '192.168.0.3', '192.168.0.4' ],
     replica_count  => '3',
   }
