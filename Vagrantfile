# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

    config.vm.network :private_network, ip: "192.168.33.33"
    config.vm.network :forwarded_port, host: 3306, guest: 3306
    config.vm.hostname = "mysql.box"


    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path    = 'puppet/modules'
        puppet.manifest_file  = 'init.pp'
        # puppet.options        = "--verbose --debug"
   end

end
