# -*- mode: ruby -*-
# vi: set ft=ruby :

cluster_size = 2

# Will be created automatically during `vagrant up`.
inventory = '.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory'
inventory_path = File.expand_path(inventory, File.dirname(__FILE__))

ansible_groups = {
  tower: (1..cluster_size).map { |i| "tower-#{i}" },
  database: ['database'],
}

Vagrant.configure('2') do |config|
  (1..cluster_size).each do |i|
    config.vm.define "tower-#{i}" do |tower|
      tower.vm.box = 'bento/centos-7.3'
      tower.vm.hostname = "tower-#{i}.local"
      tower.vm.network 'private_network', type: 'dhcp'
    end
  end

  config.vm.define 'database' do |database|
    database.vm.box = 'bento/centos-7.3'
    database.vm.hostname = 'database.local'
    database.vm.network 'private_network', type: 'dhcp'

    # The only reason we are definining provisioners on the database vm
    # is because it is the last machine to come online.
    # https://www.vagrantup.com/docs/provisioning/ansible.html#tips-and-tricks
    database.vm.provision 'bootstrap', type: 'ansible' do |ansible|
      ansible.limit = 'all'
      ansible.groups = ansible_groups
      ansible.playbook = 'provisioning/bootstrap.yml'
    end

    database.vm.provision 'install', type: 'ansible' do |ansible|
      ansible.limit = 'all'
      ansible.groups = ansible_groups
      ansible.playbook = 'provisioning/install_tower.yml'
      ansible.extra_vars = { inventory_path: inventory_path }
      ansible.raw_arguments = ['--connection=local', '--inventory=localhost,']
    end
  end

  config.vm.provider 'vmware_fusion' do |v|
    v.vmx['memsize'] = '2048'
  end
end
