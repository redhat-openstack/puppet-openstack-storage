# OpenStack GlusterFS client
class gluster::client {
    
    package { ['glusterfs-fuse', 'glusterfs-api']:
        ensure => installed,
    }
}
