Vagrant.configure("2") do |config|

  # Base Vagrant Box
  config.vm.box = "chef/centos-6.5"

  # Networking
  config.vm.hostname = "vagrant.den.com"
  config.vm.network :public_network, :bridge => "wlan0"
#  config.vm.network = "public_network", :bridge => 'wlan0'
  config.vm.provision :shell, :path => "bootstrap.sh"

  # Puppet server configuration
#  config.vm.provision :puppet_server do |puppet| 
#    puppet.puppet_server = "192.168.0.18"
#    puppet.puppet_node = "vagrant.example.com"
#    puppet.options = "--verbose --debug"
#  end
end
