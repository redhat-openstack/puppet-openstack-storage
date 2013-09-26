class gluster::variables {

    $replicacount = $::replicacount ? {
        ''      => 2,
         default => $::replicacount
    }
    
    $gluster_server_peers = $::gluster_server_peers ? {
        ''      => false,
        default => $::gluster_server_peers
    }

}
