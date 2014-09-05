#
# Cookbook Name:: user
# Recipe:: default
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

users = data_bag('user')
users.each do |user_id|
  u = data_bag_item('user', user_id)
  user u['id'] do
    action   :create
    group    u['group']
    password u['password']
  end
end
