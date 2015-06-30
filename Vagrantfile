# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Global box settings
  config.omnibus.chef_version = '12.1.0'
  config.berkshelf.enabled = true
  config.vm.synced_folder "~/.m2", "/home/vagrant/.m2"
  config.vm.synced_folder "~/workspace", "/home/vagrant/workspace"
  config.ssh.forward_x11 = true
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
  else
    puts 'vagrant-cachier is not installed, caching will not be enabled'
  end
  if Vagrant.has_plugin?("landrush")
    config.landrush.enabled = true
  else
    puts 'landrush not installed, dns resolution will not be available'
  end
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http = ENV['http_proxy']
    config.proxy.https = ENV['https_proxy']
    config.proxy.no_proxy = "localhost, 127.0.0.1, *.vagrant.dev"
  end

  # Define VM
  config.vm.define "dev" do |dev|
    dev.vm.hostname =  'dev.vagrant.dev'
    dev.vm.box = 'chef/ubuntu-14.04'
    dev.vm.network :private_network, type: "dhcp"
    dev.vm.provision "chef_zero" do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe 'devEnv::default'
    end
  end
end
