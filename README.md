# Knife lxc plugin

Plugin that extends knife cli with commands for managing lxc containers

## Installation

Install from command line
$ gem install knife-lxc

Or add dependency to your Gemfile

gem 'knife-lxc'

## Usage

List of commands
$ knife lxc

Create new container
$ knife lxc server create -N container_name

List containers
$ knife lxc server list

Delete container
$ knife lxc server delete -N container_name

## License

[MIT License](https://github.com/creatary/knife-lxc/blob/master/MIT-LICENSE)