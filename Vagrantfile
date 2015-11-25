# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.vm.synced_folder Dir.getwd, "/home/vagrant/mesos-playbook", nfs: true

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # config.ssh.insert_key = true

  # ubuntu 14.04
  config.vm.define 'ubuntu', primary: true do |c|
    c.vm.network "private_network", ip: "192.168.100.3"
    c.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
    c.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    c.vm.hostname = "ubuntu"
    c.vm.provision "shell" do |s|
      s.inline = "apt-get update -y; apt-get install -y software-properties-common; apt-add-repository ppa:ansible/ansible; apt-get update -y; apt-get install -y ansible; cd mesos-playbook; ansible-playbook -i vagrant_ubuntu site.yml -e mesos_iface=eth1 -u vagrant -c local -vv"
      s.privileged = true
    end
  end

  # centos 7:
  config.vm.define 'centos' do |c|
    c.vm.network "private_network", ip: "192.168.100.4"
    c.vm.box = "centos/7"
    c.vm.hostname = "centos"
    c.vm.provision "shell" do |s|
      s.inline = "yum install -y epel-release; yum install -y ansible; cd mesos-playbook; ansible-playbook -i vagrant_centos site.yml -e mesos_iface=eth1 -u vagrant -c local -vv"
      s.privileged = true
    end
  end

end