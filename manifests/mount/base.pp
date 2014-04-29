# OpenStack GlusterFS client
# This is an interface to offer compatibility with newer version of gluster
# purpleidea/puppet-gluster module
class gluster::mount::base (
# Dummy variables for purpleidea/puppet-gluster interface compatibility
  $repo = false,
  $version = ''
) {
    package { ['glusterfs-fuse', 'glusterfs-api']:
        ensure => installed,
    }
}
