require 'chef/knife'

module KnifeLxc
  LXC_CONFIG_PATHS = ['/tmp', '/etc/lxc']

  class LxcServerList < Chef::Knife

    banner "knife lxc server list"


    # This method will be executed when you run this knife command.
    def run
      puts "Lxc containers list"
      containers = `lxc-ls`.split.uniq
      server_list = [
        ui.color('Name', :bold),
          ui.color('Ip', :bold)
      ]
      containers.each do |container|
        server_list << container
        server_list << get_ip(container)
      end
      puts ui.list(server_list, :uneven_columns_across, 2)
    end

    private
    def get_ip(container)
      config_path = find_config(container)
      File.read(config_path).split("\n").each do |row|
        if row =~ /ipv4/
          ip = row.split("=").last
          ip.strip!
          return ip.split("/").first
        end
      end unless config_path.nil?
      ""
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
      nil
    end


  end
end