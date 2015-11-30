Vagrant.configure("2") do |config|

  # Base Vagrant Box
  config.vm.box = "chef/centos-6.5"
  config.vm.provision :shell, :path => "bootstrap.sh"
  # Networking
#  config.vm.hostname = "vagrant.den.com"
  config.vm.network "public_network", ip: "192.168.43.81", bridge => "wlan0"

  # Puppet server configuration
#  config.vm.provision :puppet_server do |puppet| 
#    puppet.puppet_server = "192.168.0.18"
#    puppet.puppet_node = "vagrant.example.com"
#    puppet.options = "--verbose --debug"
#  end
end
