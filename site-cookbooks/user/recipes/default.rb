#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'group'

# data = Chef::EncryptedDataBagItem.load('user', 'mgi')

# user data['id'] do
#   action   :create
#   group    data['group']
#   password `openssl passwd -1 #{data['password']}`.chomp
# end
