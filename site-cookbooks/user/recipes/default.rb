#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

name = 'mgi'

user name do
  action :create
  password "$1$ijQNbBTK$//GirAKqmfH7I.qtlGro9."
end

directory "/home/#{name}/.ssh" do
  action :create
  owner name
  group name
  mode '700'
end

cookbook_file "/home/#{name}/.ssh/authorized_keys" do
  action :create
  owner name
  group name
  mode '600'
  source 'authorized_keys'
end
