#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# name = 'mgi'

# user name do
#   action :create
#   password "$1$ijQNbBTK$//GirAKqmfH7I.qtlGro9."
# end

# directory "/home/#{name}/.ssh" do
#   action :create
#   owner name
#   group name
#   mode '700'
# end

# cookbook_file "/home/#{name}/.ssh/authorized_keys" do
#   action :create
#   owner name
#   group name
#   mode '600'
#   source 'authorized_keys'
# end

# cookbook_file "/etc/sudoers" do
#   action :create
#   owner 'root'
#   group 'root'
#   mode '440'
# end

data = Chef::EncryptedDataBagItem.load('user', 'mgi')

group 'dev' do
  action :create
end

user data['id'] do
  action   :create
  group    data['group']
  password `openssl passwd -1 #{data['password']}`.chomp
end
