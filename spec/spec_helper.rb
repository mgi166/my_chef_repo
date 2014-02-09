require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS

attributes = YAML.load_file('spec/server_attributes.yml')

Rspec.configure do |c|
  c.host       = ENV['TARGET_HOST']
  options      = Net::SSH::Config.for(c.host)
  user         = options[:user] || Etc.getlogin
  c.ssh        = Net::SSH.start(c.host, user, options)
  c.os         = backend.check_os
  set_property   attributes[c.host]
end

# default description
#
# RSpec.configure do |c|
#   if ENV['ASK_SUDO_PASSWORD']
#     require 'highline/import'
#     c.sudo_password = ask("Enter sudo password: ") { |q| q.echo = false }
#   else
#     c.sudo_password = ENV['SUDO_PASSWORD']
#   end
#   c.before :all do
#     block = self.class.metadata[:example_group_block]
#     if RUBY_VERSION.start_with?('1.8')
#       file = block.to_s.match(/.*@(.*):[0-9]+>/)[1]
#     else
#       file = block.source_location.first
#     end
#     host  = File.basename(Pathname.new(file).dirname)
#     if c.host != host
#       c.ssh.close if c.ssh
#       c.host  = host
#       options = Net::SSH::Config.for(c.host)
#       user    = options[:user] || Etc.getlogin
#       vagrant_up = `vagrant up default`
#       config = `vagrant ssh-config default`
#       if config != ''
#         config.each_line do |line|
#           if match = /HostName (.*)/.match(line)
#             host = match[1]
#           elsif  match = /User (.*)/.match(line)
#             user = match[1]
#           elsif match = /IdentityFile (.*)/.match(line)
#             options[:keys] =  [match[1].gsub(/"/,'')]
#           elsif match = /Port (.*)/.match(line)
#             options[:port] = match[1]
#           end
#         end
#       end
#       c.ssh   = Net::SSH.start(host, user, options)
#     end
#   end
# end
