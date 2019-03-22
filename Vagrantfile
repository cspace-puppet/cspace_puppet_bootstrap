# VAGRANT CONFIG

MODULES = {
  'centos/7' => '/etc/puppet/modules',
  'ubuntu/bionic64' => '/usr/share/puppet/modules',
}

box = ENV.fetch('CSPACE_PUPPET_BOOTSTRAP_BOX', 'ubuntu/bionic64')
cpu = ENV.fetch('CSPACE_PUPPET_BOOTSTRAP_CPU', 2)
mem = ENV.fetch('CSPACE_PUPPET_BOOTSTRAP_MEM', 2048)
modules_path = MODULES[box]
setup = <<-SCRIPT
  echo "export VAGRANT_ENV=true" >> /etc/environment
SCRIPT

Vagrant.configure('2') do |config|
  config.vm.provider 'virtualbox' do |v|
    v.cpus = cpu
    v.memory = mem
  end

  config.vm.box = box
  config.vm.provision :shell, inline: setup
  config.vm.provision 'shell' do |s|
    s.path = 'scripts/bootstrap-cspace-modules.sh'
    s.args = ['-y']
  end
  config.vm.network :forwarded_port, guest: 8180, host: 8180
  config.vm.synced_folder 'src/', modules_path, owner: 'root', group: 'root'
end
