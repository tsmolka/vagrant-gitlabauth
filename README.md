[![Build Status](https://travis-ci.org/tsmolka/vagrant-gitlabauth.svg?branch=master)](https://travis-ci.org/tsmolka/vagrant-gitlabauth) [![Gem Version](https://badge.fury.io/rb/vagrant-gitlabauth.svg)](http://badge.fury.io/rb/vagrant-gitlabauth)

# vagrant-gitlabauth

Private, versioned Vagrant boxes hosted via LFS in [GitLab](https://gitlab.com/). Inspired by [vagrant-s3auth](https://github.com/WhoopInc/vagrant-s3auth).

## Installation

From the command line:

```bash
$ vagrant plugin install vagrant-gitlabauth
```

## Usage
First generate private token in GitLab Profile Setting page of your account (e.g. profile/account, see https://docs.gitlab.com/ce/api/README.html#private-tokens for more details). 

`vagrant-gitlabauth` will then automatically use environment variable `PRIVATE_TOKEN` as `private_token` query parameter and essentially authenticate following requests:
```
gitlab://git.private/group/project/raw/master/box
gitlab://git.private/group/project/raw/master/metadata
gitlabs://git.private/group/project/raw/master/box
gitlabs://git.private/group/project/raw/master/metadata
```

Hints:
 - Make sure you use `--cacert`, `--cert` or similar parameters when working with self-signed SSL certificates (e.g. `vagrant box add --insecure gitlabs://git.private/group/project/raw/master/box`)

## Auto-install

Add following to your Vagrantfile:

```ruby
['vagrant-gitlabauth'].each do |plugin_name|
  unless Vagrant.has_plugin?(plugin_name)
    # Attempt to install missing plugin
    system("vagrant plugin install #{plugin_name}") || exit!
    # Relaunch Vagrant so the plugin is detected. Exit with the same status code.
    exit system('vagrant', *ARGV)
  end
end
```

## References
[metadata-boxes]: http://docs.vagrantup.com/v2/boxes/format.html
[vagrant]: http://vagrantup.com
