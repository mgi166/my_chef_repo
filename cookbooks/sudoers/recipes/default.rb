#
# Cookbook Name:: sudoers
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/sudoers' do
  action :create
  mode   '0440'
  owner  'root'
  group  'root'
  variables(groups: ['developer'])
end
