# Vagrant MySQL #

## Puropse ##

This is a vagrant box that I use for my local developpements to provide a clean MySQL database.

## Prerequisite ##

This box requieres vagrant 1.6+ and virtualbox to be installed on the host machine.

## Usage ##

### Setting up the VM ###
After cloning the project, you will need to start the vagrant box.
```bash
    vagrant up
```

There is still a little bug to fix (see below) in the provisionning configuration, so once the machine is running you may need to re-provision it.
```bash
    vagrant provison
```

### MySQL Access ##

Once the machine is ready, the local MySQL default port (3306) on host machine will be forwarded to the 3306 port on guest machine.

You will now be able to access the database with this credentials :
+ **Host :** localhost
+ **database :** test
+ **User :** test
+ **Password :** azerty

This can be changed in the **puppet/manifests/init.pp** file
```ruby
    mysql::db { 'test':
        user     => 'test',
        password => 'azerty',
        host     => '%',
        grant    => ['ALL'],
    }
```

You will need to restart the guest machine for the changes to be applied
```bash
    vagrant reload --provision
```

### Local MySQL conflict ###

If you already use the 3306 port for a local MySQL, you can change it by modifying the **Vagrantfile** file.
Let's say you want to set it to 3307.
```ruby
    config.vm.network :forwarded_port, host: 3307, guest: 3306
```

You will need to restart the guest machine for the changes to be applied
```bash
    vagrant reload
```

## Know issues / Enhancements ##

### Issues ###

+ There can be sometime an execution order problem in provisioning configuration, and mysql might execute before apt-get is ready. This requires to re-provision after starting the VM for the first time.

### Enhancements ###

+ Set the MySQL config in the Vagrantfile