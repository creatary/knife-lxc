require 'chef/knife'

module KnifeLxc

  class LxcServerCreate < Chef::Knife
    banner "knife lxc server create (options)"

    # This method will be executed when you run this knife command.
    def run
      puts "Hello, World!"
    end

  end
end