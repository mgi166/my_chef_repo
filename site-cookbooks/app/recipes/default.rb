#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/var/app' do
  action :create
  owner 'mgi'
  group 'mgi'
end
