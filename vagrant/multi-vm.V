Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
      v.gui = true
      v.memory = 2048
      v.cpus = 2
    end

    config.vm.define "host1" do |host1|
      host1.vm.box = "centos/7"
      host1.vm.hostname = "host1"
      host1.vm.synced_folder ".", "/vagrant", type: "virtualbox"
      host1.vm.network "public_network", use_dhcp_assigned_default_route: true
    end

    config.vm.define "host2" do |host2|
      host2.vm.box = "centos/7"
      host2.vm.hostname = "host2"
      host2.vm.synced_folder ".", "/vagrant", type: "virtualbox"
      host2.vm.network "public_network", use_dhcp_assigned_default_route: true
    end
end



Known Issue:
when you met ssh issue on Win10, with an clean fresh VagrantFile. Please remote the default openssh client.
Here is the detail:
Win10 has include a ssh client. You just need to remove it from "settings => apps => apps and features => Optional features"
or
Add vagrant ssh to PATH
https://github.com/hashicorp/vagrant/issues/9831
