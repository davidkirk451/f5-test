# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|
  config.vm.define "webserver-a-centos7", autostart: true do |webserver|
    webserver.vm.box = 'centos/7'
    webserver.vm.hostname = 'webserver-a'
    webserver.vm.network "private_network", ip: "192.168.1.30"

    config.vm.provider 'virtualbox' do |webservervm|
      webservervm.name = "dev-webserver_centos7_#{Time.now.strftime('%Y%m%d%H%M%S')}"
      webservervm.customize ["modifyvm", :id, "--memory", 512]
      webservervm.customize ["modifyvm", :id, "--cpus", 1]
    end

    webserver.vm.synced_folder 'local-roots/salt', '/local-srv/salt'
    webserver.vm.synced_folder 'local-roots/pillar', '/local-srv/pillar'

    config.vm.provision :salt do |saltwebserver|
      saltwebserver.install_type = 'stable'
      saltwebserver.install_args = '2018.3'
      saltwebserver.always_install = false
      # saltwebserver.minion_config = 'minion-configs/minion-webserver'
      saltwebserver.masterless = true
      saltwebserver.run_highstate = true
      saltwebserver.verbose = true
      saltwebserver.log_level = 'warning'
      saltwebserver.bootstrap_options = '-F -P -c /tmp'
      saltwebserver.colorize = true
    end

  end

  config.vm.define "webserver-b-centos7", autostart: true do |webserver|
    webserver.vm.box = 'centos/7'
    webserver.vm.hostname = 'webserver-b'
    webserver.vm.network "private_network", ip: "192.168.1.31"

    config.vm.provider 'virtualbox' do |webservervm|
      webservervm.name = "dev-webserver_centos7_#{Time.now.strftime('%Y%m%d%H%M%S')}"
      webservervm.customize ["modifyvm", :id, "--memory", 512]
      webservervm.customize ["modifyvm", :id, "--cpus", 1]
    end

    webserver.vm.synced_folder 'local-roots/salt', '/local-srv/salt'
    webserver.vm.synced_folder 'local-roots/pillar', '/local-srv/pillar'

    config.vm.provision :salt do |saltwebserver|
      saltwebserver.install_type = 'stable'
      saltwebserver.install_args = '2018.3'
      saltwebserver.always_install = false
      # saltwebserver.minion_config = 'minion-configs/minion-webserver'
      saltwebserver.masterless = true
      saltwebserver.run_highstate = true
      saltwebserver.verbose = true
      saltwebserver.log_level = 'warning'
      saltwebserver.bootstrap_options = '-F -P -c /tmp'
      saltwebserver.colorize = true
    end

  end

  config.vm.define "webserver-c-windows", autostart: true do |webserver|
    webserver.vm.box = 'apolloclark/windows2012r2'
    webserver.vm.hostname = 'webserver-c'
    webserver.vm.network "private_network", ip: "192.168.1.32"

    config.vm.provider 'virtualbox' do |webservervm|
      webservervm.name = "dev-webserver_windows_#{Time.now.strftime('%Y%m%d%H%M%S')}"
      webservervm.customize ["modifyvm", :id, "--memory", 512]
      webservervm.customize ["modifyvm", :id, "--cpus", 1]
      webservervm.gui = true
    end

    webserver.vm.synced_folder 'local-roots/salt', '/local-srv/salt'
    webserver.vm.synced_folder 'local-roots/pillar', '/local-srv/pillar'

    config.vm.provision :salt do |saltwebserver|
      # saltwebserver.minion_config = 'minion-configs/minion-webserverwindows'
      saltwebserver.masterless = true
      saltwebserver.run_highstate = true
      saltwebserver.verbose = true
      saltwebserver.bootstrap_options = '-F -P -c /tmp'
    end
  end

end
