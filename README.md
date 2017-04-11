## Ansible Tower Vagrant Cluster

### Usage

```
$ vagrant up
```

Once provisioning is complete, the Tower UI will be available at [http://tower-1.local](http://tower-1.local).

#### Possible Improvements

- Use something like HAProxy to load balance HTTP traffic between the Tower nodes.
