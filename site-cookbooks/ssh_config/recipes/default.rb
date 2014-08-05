#
# Cookbook Name:: ssh_config
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

name = 'mgi'

directory "/home/#{name}/.ssh/bitbucket" do
  action :create
  owner  name
  group  name
end

directory "/home/#{name}/.ssh/target-host" do
  action :create
  owner  name
  group  name
end

cookbook_file "/home/#{name}/.ssh/bitbucket/id_rsa" do
  action :create
  owner  name
  group  name
  mode  '600'
  source 'bitbucket.id_rsa'
end

# cookbook_file "/home/#{name}/.ssh/target-host/id_rsa" do
#   action :create
#   owner  name
#   mode  '600'
#   group  name
# end

cookbook_file "/home/#{name}/.ssh/config" do
  action :create
  owner  name
  group  name
  source 'config'
end
