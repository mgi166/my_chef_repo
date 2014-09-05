#
# Cookbook Name:: user
# Recipe:: encrypted
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'group'

data = Chef::EncryptedDataBagItem.load('encrypted_user', 'dev')

user data['id'] do
  action   :create
  group    data['group']
  password `openssl passwd -1 #{data['password']}`.chomp
end
