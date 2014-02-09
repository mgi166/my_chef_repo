require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port('80') do
  it { should be_listening }
end

describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
  its(:content) { should match /error_log\s+\/var\/log\/nginx\/error\.log/}
  its(:content) { should match /access_log\s+\/var\/log\/nginx\/access\.log/ }
  its(:content) { should match /include\s\/etc\/nginx\/conf\.d\/\*\.conf/ }
end
