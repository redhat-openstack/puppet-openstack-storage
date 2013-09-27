# bare minimum needed for a new glusterfs brick
class gluster::server (
  $server_package_name          = $gluster::params::server_package_name,
  $geo_replication_package_name = $gluster::params::geo_replication_package_name,
  $server_service_name          = $gluster::params::server_service_name,
  ) inherits gluster::params {

  Package {
    ensure => installed
  }

  package { [ $server_package_name, $geo_replication_package_name ]:
  } -> service { $server_service_name:
    ensure => 'running',
  } 

  firewall { '001 RPC incoming':
    proto    => 'tcp',
    dport    => [ '111' ],
    action   => 'accept',
  } 

  firewall { '002 gluster daemon and management incoming':
    proto    => 'tcp',
    dport    => [ '24007', '24008' ],
    action   => 'accept',
  }

  # 1 port per brick - We start with three
  firewall { '001 gluster bricks incoming':
    proto    => 'tcp',
    dport    => [ '24009', '24010', '24011'],
    action   => 'accept',
  } 
}
