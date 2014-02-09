require 'rake'
require 'rspec/core/rake_task'

hosts = [
         {
           name:  'default',
           roles: ['proxy']
         }
]

hosts = hosts.map do |host|
  {
    name:       host[:name],
    short_name: host[:name].split('.').first,
    roles:      host[:roles],
  }
end

class ServerspecTask < RSpec::Core::RakeTask
  attr_accessor :target

  def spec_command
    cmd = super
    "env TARGET_HOST=#{target} #{cmd}"
  end
end

namespace :serverspec do
  task :all => hosts.map {|h| 'serverspec:' + h[:short_name] }
  hosts.each do |host|
    desc "Run serverspec to #{host[:name]}"
    ServerspecTask.new(host[:short_name].to_sym) do |t|
      t.target  = host[:name]
      t.pattern = 'spec/{' + host[:roles].join(',') + '}/*_spec.rb'
    end
  end
end

# default description
#
# RSpec::Core::RakeTask.new(:spec) do |t|
#   t.pattern = 'spec/*/*_spec.rb'
# end
