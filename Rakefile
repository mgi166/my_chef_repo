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

task :default => "spec:all".to_sym

namespace :spec do
  task :all => attributes.keys.map {|key| 'serverspec:' + key.split('.').first }
  attributes.keys.each do |key|
    desc "Run serverspec to #{key}"
    ServerspecTask.new(key.split('.').first.to_sym) do |t|
      t.target  = key
      t.pattern = 'spec/{' + attributes[key][:roles].join(',') + '}/**/*_spec.rb'
    end
  end
end
