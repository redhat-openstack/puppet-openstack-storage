# Define commonly used parameters for server and client
class gluster::params {
  case $::osfamily {
    'RedHat': {
      # Packages
      $server_package_name          = 'glusterfs-server'
      $geo_replication_package_name = 'glusterfs-geo-replication'
      $client_package_name          = 'glusterfs-fuse'
      # Services
      $server_service_name          = 'glusterd'
      $rpc_service_name             = 'rpcbind'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat")
    }
  }
}
