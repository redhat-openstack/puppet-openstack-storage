# OpenStack GlusterFS client
# This is deprecated and replaced with gluster::mount::base class
class gluster::client {

    package { ['glusterfs-fuse', 'glusterfs-api']:
        ensure => installed,
    }
}
