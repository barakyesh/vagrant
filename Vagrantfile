#vagrant plugin install vagrant-timezone
unless Vagrant.has_plugin?("vagrant-timezone")
  raise 'vagrant-timezone is not installed! please run "vagrant plugin install vagrant-timezone"'
end

Vagrant.configure("2") do |config|

	config.timezone.value = "UTC"
    config.vm.box = "centos/7"

    config.ssh.insert_key = false
    config.vm.network "private_network", ip: "192.168.33.12"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provision "file", source: "init.sql", destination: "/tmp/mysql/init.sql"

    config.vm.provision "docker" do |d|
        d.pull_images "mariadb"
    end

    config.vm.provision :shell, path: "docker_run.sh"

    config.vm.provision :shell, path: "install.sh"

    config.vm.provider "virtualbox" do |vb|
        vb.name = "CentOS_7_mariadb"
        vb.memory = "1024"
        vb.cpus = "1"
    end

end
