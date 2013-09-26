# setup the minimum for an OpenStack GlusterFS client
class gluster::client {
    
    package { 'glusterfs-fuse':
        ensure => installed,
    }
}
