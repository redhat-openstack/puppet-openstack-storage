# provide GlusterFS glance volume
class gluster::volume::glance {

   class { 'gluster::server': }

   volume { 'glance':
     ensure         => present,
     path           => '/srv/gluster/glance',
     peers          => [ '192.168.0.2', '192.168.0.3', '192.168.0.4' ],
     replica_count  => '3',
   }
