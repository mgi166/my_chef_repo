require 'spec_helper'
require 'yaml'

attributes  = YAML.load_file('./spec/server_attributes.yml')
target_host = ENV['TARGET_HOST']

(attributes[target_host][:disabled_daemons] || []).each do |service|
  describe service(service) do
    it { should_not be_enabled }
    it { should_not be_running.under('supervisor') }
  end
end
