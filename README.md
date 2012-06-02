# Knife lxc plugin

Plugin that extends knife cli with commands for managing lxc containers.

## Installation

### OS requirements
Tested on ubuntu 10.04 with ruby 1.8.7. You need to install lxc packages.

### Gem installation
Install from command line

    $ gem install knife-lxc

Or add dependency to your Gemfile

    gem 'knife-lxc'

## Usage

### Create new container

    $ knife lxc server create -N container_name

It will use default template (lucid-chef) for creating lxc container.

You can pass additional parameters

    -d, --distro DISTRO              Bootstrap a lxc container using a template; default is 'lucid-chef'
        --ip IP                      Ip for new container
    -E, --environment ENVIRONMENT    Set the Chef environment

### List containers

    $ knife lxc server list

### Delete container

    $ knife lxc server delete -N container_name

### Help

    $ knife lxc

## License

[MIT License](https://github.com/creatary/knife-lxc/blob/master/MIT-LICENSE)