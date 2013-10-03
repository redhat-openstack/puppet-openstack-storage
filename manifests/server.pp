# bare minimum needed for a new glusterfs brick
class gluster::server (
  $server_package_name          = $gluster::params::server_package_name,
  $geo_replication_package_name = $gluster::params::geo_replication_package_name,
  $server_service_name          = $gluster::params::server_service_name,
  $rpc_service_name             = $gluster::params::rpc_service_name,
  ) inherits gluster::params {

  Package {
    ensure => installed
  }

  package { [ $server_package_name, $geo_replication_package_name ]:
  } -> service { [ $server_service_name, $rpc_service_name ]:
    ensure => 'running',
  } 
}
