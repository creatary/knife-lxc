require 'chef/knife'
require 'toft'

module KnifeLxc

  class LxcServerDelete < Chef::Knife
    include Toft

    banner "knife lxc delete -N NODE"

    option :node_name,
      :short => "-N NAME",
      :long => "--node-name NAME",
      :description => "Container name and chef node name",
      :required => true

    # This method will be executed when you run this knife command.
    def run
      puts "Delete container #{config[:node_name]}"
      raise "Container not exists!! " unless container_exists? config[:node_name]
      n = Node.new(config[:node_name])
      n.destroy
    end

    def container_exists?(name)
      `lxc-ls` =~ /#{name}/
    end


  end
end