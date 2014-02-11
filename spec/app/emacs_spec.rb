require 'spec_helper'

describe command('which emacs') do
  its(:stdout) { should match /emacs/ }
end
