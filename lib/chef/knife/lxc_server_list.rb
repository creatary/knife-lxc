require 'chef/knife'

module KnifeLxc
  LXC_CONFIG_PATHS = ['/tmp', '/etc/lxc']

  class LxcServerList < Chef::Knife

    banner "knife lxc server list"


    # This method will be executed when you run this knife command.
    def run
      puts "Lxc containers list"
      containers = `lxc-ls`.split.uniq!
      containers.each do |container|
        ip = get_ip container
        puts "Name: #{container}, Ip: #{ip}"
      end
    end

    private
    def get_ip(container)
      config_path = find_config(container)
      File.read( config_path).split("\n").each do |row|
        if row =~ /ipv4/
          ip = row.split("=").last
          ip.strip!
          return ip.split("/").first
        end
      end
    end

    def find_config(container)
      LXC_CONFIG_PATHS.each do |path|
        config_path = "#{path}/#{container}"
        if File.exists? config_path
          return config_path
        end

        # for toft
        config_path = "#{path}/#{container}-conf"
        if File.exists? config_path
          return config_path
        end
      end
    end


  end
end