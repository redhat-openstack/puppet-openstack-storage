openstack-gluster
=================

Use the Foreman/Puppet to end-to-end provision Gluster-backed OpenStack storage controllers for Cinder, Glance and Swift (.. or at least that's the idea).
This will be utilized to provision bare-metal nodes as GlusterFS storage controllers via the Foreman and puppet.

Server side example
===================

class storage {  
  
  class { 'gluster::server': }  
  
  volume { 'glance':  
    ensure         => present,  
    path           => '/gluster/glance',  
    peers          => [ '192.168.0.1', '192.168.0.2', '192.168.0.3' ],  
    replica_count  => '3',  
  }  
  
  volume { 'cinder':  
    ensure         => present,  
    path           => '/gluster/cinder',  
    peers          => [ '192.168.0.1', '192.168.0.2', '192.168.0.3' ],  
    replica_count  => '3',  
  }  
}  
