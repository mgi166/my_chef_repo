require 'spec_helper'

describe package('emacs') do
  it { should be_installed }
end
