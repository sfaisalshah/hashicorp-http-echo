# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.ssh.insert_key = false
    config.vbguest.auto_update = false
    config.vm.provider "virtualbox" do |vb|
        vb.memory = 128
        vb.cpus = 1
        vb.linked_clone = true
      end

    config.vm.define "master" do |master_config|
        master_config.vm.hostname = "master"
        master_config.vm.network "private_network", ip: "10.10.10.10"
        master_config.vm.provision "shell", path: "bootstrap/base.sh"
        master_config.vm.provision "file", source: "bootstrap/compose.yml", destination: "/home/vagrant/compose.yml"
        master_config.vm.provision "shell", inline: "docker swarm init --advertise-addr 10.10.10.10 --listen-addr 10.10.10.10:2377 && docker swarm join-token --quiet worker > /vagrant/token"
        master_config.vm.provider "virtualbox" do |vb|
            vb.name = "master"
            vb.memory = 512
            vb.cpus = 2
        end
    end

    (1..3).each do |i|
        config.vm.define "node-#{i}" do |node_config|
            node_config.vm.hostname = "node-#{i}"
            node_config.vm.network "private_network", ip: "10.10.10.1#{i}"
            node_config.vm.provision "shell", path: "bootstrap/base.sh"
            node_config.vm.provider "virtualbox" do |vb|
                vb.name = "node-#{i}"
                vb.memory = 512
                vb.cpus = 2
            end
            node_config.vm.provision "shell", inline: "docker swarm join --advertise-addr 10.10.10.1#{i} --listen-addr 10.10.10.1#{i}:2377 --token $(cat /vagrant/token) 10.10.10.10:2377"
        end
    end 

end
