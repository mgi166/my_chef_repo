require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

attributes = YAML.load_file('./spec/server_attributes.yml')

class ServerspecTask < RSpec::Core::RakeTask
  attr_accessor :target

  def spec_command
    cmd = super
    "env TARGET_HOST=#{target} #{cmd}"
  end
end

task :default => "serverspec:all".to_sym
namespace :serverspec do
  task :all => attributes.keys.map {|key| 'serverspec:' + key.split('.').first }
  attributes.keys.each do |key|
    desc "Run serverspec to #{key}"
    ServerspecTask.new(key.split('.').first.to_sym) do |t|
      t.target  = key
      t.pattern = 'spec/{' + attributes[key][:roles].join(',') + '}/*_spec.rb'
    end
  end

  namespace :debug do
    attributes.keys.each do |key|
      desc "Run serverspec to #{key} with argument spec files"
      ServerspecTask.new(key.split('.').first.to_sym) do |t|
        raise ArgumentError, 'Please specify the spec file 1 or more.' if ARGV.size == 1
        spec_files = ARGV.dup.drop(1)
        t.target  = key
        t.pattern = '{' + spec_files.join(',') + '}'
      end
    end
  end
end

# default description
#
# RSpec::Core::RakeTask.new(:spec) do |t|
#   t.pattern = 'spec/*/*_spec.rb'
# end
