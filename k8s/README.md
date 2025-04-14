# README

## Ubuntu 22.04.x

### Setup a node with k8s components
```
$ ./setup.sh
```

### Create a single-node cluster
```
$ ./create_singlenode_cluster.sh
```

### Create multiple nodes cluster
```
# create a control plane
$ ./create_control_plane.sh

# jain a worker node
$ ./join_worker_node.sh
```

### Clean up cluster
```
$ ./cleanup_cluster.sh
```

### Useful commands
```
$ kubectl cluster-info
$ kubectl get nodes
```

