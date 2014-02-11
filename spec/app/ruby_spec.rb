require 'spec_helper'

describe command('runuser -l "vagrant" -c "ruby -v"') do
  its(:stdout) { should match /2\.0\.0p0/ }
end

describe command('runuser -l "vagrant" -c "gem list"') do
  its(:stdout) { should match /bundler.*1\.3\.5/ }
end
