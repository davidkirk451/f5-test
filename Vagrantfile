#`` -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure("2") do |config|

  config.vm.define "salt-master", autostart: true, primary: true do |saltmaster|
    saltmaster.vm.box = 'centos/7'
    saltmaster.vm.hostname = 'salt-master'
    saltmaster.vm.network "public_network", bridge: "en1: Ethernet", ip: "192.168.1.100", netmask:"255.255.254.0"

    saltmaster.vm.provider 'virtualbox' do |salt_mastervm|
      salt_mastervm.name = "dev-salt_master_#{Time.now.strftime('%Y%m%d%H%M%S')}"
      salt_mastervm.customize ["modifyvm", :id, "--memory", 512]
      salt_mastervm.customize ["modifyvm", :id, "--cpus", 1]
    end

    saltmaster.vm.synced_folder 'local-roots/salt', '/srv/salt'
    saltmaster.vm.synced_folder 'local-roots/pillar', '/srv/pillar'
    saltmaster.vm.synced_folder '../apache-formula', '/srv/formulas/apache-formula'
    saltmaster.vm.synced_folder 'local-roots/reactor', '/srv/reactor'

    saltmaster.vm.provision :salt do |saltmaster|
      saltmaster.install_type = 'stable'
      saltmaster.install_args = '2018.3'
      saltmaster.always_install = false
      saltmaster.install_master = true
      saltmaster.master_config = 'master'
      saltmaster.minion_config = 'minion'
      saltmaster.run_highstate = false
      saltmaster.verbose = true
      saltmaster.log_level = 'warning'
      # saltmaster.bootstrap_script = 'packages/bootstrap-salt.sh'
      # saltmaster.bootstrap_options = '-F -P -c /tmp'
      saltmaster.colorize = true
    end

  end

  config.vm.define "webserver-A-centos7", autostart: false do |webserver|
    webserver.vm.box = 'centos/7'
    webserver.vm.hostname = 'webserver-A'
    webserver.vm.network "public_network", bridge: "en1: Ethernet", ip: "192.168.1.30", netmask:"255.255.254.0"

    config.vm.provider 'virtualbox' do |webservervm|
      webservervm.name = "dev-webservera_centos7_#{Time.now.strftime('%Y%m%d%H%M%S')}"
      webservervm.customize ["modifyvm", :id, "--memory", 512]
      webservervm.customize ["modifyvm", :id, "--cpus", 1]
    end

    config.vm.provision :salt do |saltwebserver|
      saltwebserver.install_type = 'stable'
      saltwebserver.install_args = '2018.3'
      saltwebserver.always_install = false
      saltwebserver.minion_config = 'minion'
      saltwebserver.run_highstate = true
      saltwebserver.verbose = true
      saltwebserver.log_level = 'warning'
      # saltwebserver.bootstrap_options = '-F -P -c /tmp'
      saltwebserver.colorize = true
    end

    config.vm.provision :shell, inline: <<-SHELL
      #Set SELINUX to permissive mode.
      sed -i 's/^SELINUX=enforcing/SELINUX=permissive/g' /etc/sysconfig/selinux
    SHELL

  end

  config.vm.define "webserver-B-centos7", autostart: false do |webserver|
    webserver.vm.box = 'centos/7'
    webserver.vm.hostname = 'webserver-B'
    webserver.vm.network "public_network", bridge: "en1: Ethernet", ip: "192.168.1.31", netmask:"255.255.254.0"

    config.vm.provider 'virtualbox' do |webservervm|
      webservervm.name = "dev-webserverb_centos7_#{Time.now.strftime('%Y%m%d%H%M%S')}"
      webservervm.customize ["modifyvm", :id, "--memory", 512]
      webservervm.customize ["modifyvm", :id, "--cpus", 1]
    end

    config.vm.provision :salt do |saltwebserver|
      saltwebserver.install_type = 'stable'
      saltwebserver.install_args = '2018.3'
      saltwebserver.always_install = false
      saltwebserver.minion_config = 'minion'
      saltwebserver.run_highstate = true
      saltwebserver.verbose = true
      saltwebserver.log_level = 'warning'
      # saltwebserver.bootstrap_options = '-F -P -c /tmp'
      saltwebserver.colorize = true
    end

    config.vm.provision :shell, inline: <<-SHELL
      #Set SELINUX to permissive mode.
      sed -i 's/^SELINUX=enforcing/SELINUX=permissive/g' /etc/sysconfig/selinux
    SHELL

  end

  config.vm.define "webserver-C-windows", autostart: false do |webserver|
    webserver.vm.box = 'apolloclark/windows2012r2'
    webserver.vm.hostname = 'webserver-C'
    webserver.vm.network "public_network", bridge: "en1: Ethernet", ip: "192.168.1.32", netmask:"255.255.254.0"
    webserver.vm.boot_timeout = 600
    webserver.vbguest.auto_update = false

    config.vm.provider 'virtualbox' do |webservervm|
      webservervm.name = "dev-webserver_windows_#{Time.now.strftime('%Y%m%d%H%M%S')}"
      webservervm.customize ["modifyvm", :id, "--memory", 512]
      webservervm.customize ["modifyvm", :id, "--cpus", 1]
      webservervm.gui = true
    end

    config.vm.provision :salt do |saltwebserver|
      saltwebserver.install_type = 'stable'
      saltwebserver.install_args = '2018.3'
      saltwebserver.minion_config = 'minion'
      saltwebserver.run_highstate = true
      saltwebserver.verbose = true
      # saltwebserver.bootstrap_options = '-F -P -c /tmp'
    end
  end

end
