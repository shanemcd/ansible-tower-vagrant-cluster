## Ansible Tower Vagrant Cluster

### Usage

#### Configure Cluster Size
```
$ export TOWER_CLUSTER_SIZE=n
```
NOTE: Default cluster size is "1" if environment variable is not provided.

#### Start vagrant cluster
```
$ vagrant up
```

Once provisioning is complete, Tower will be available at [http://tower.local](http://tower.local).
