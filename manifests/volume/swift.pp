# provide GlusterFS swift volume
class gluster::volume::swift {

   class { 'gluster::server': }

   volume { 'swift':
     ensure         => present,
     path           => '/srv/gluster/swift',
     peers          => [ '192.168.0.2', '192.168.0.3', '192.168.0.4' ],
     replica_count  => '3',
   }
