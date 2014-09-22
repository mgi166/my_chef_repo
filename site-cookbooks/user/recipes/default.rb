#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'group'

users = data_bag('user')
users.each do |user_id|
  u = data_bag_item('user', user_id)
  user u['id'] do
    action   :create
    group    u['group']
    password u['password']
  end

  if u.key?('authorized_keys')
    directory "/home/#{u['id']}/.ssh" do
      action :create
      owner  u['id']
      group  u['id']
    end

    file "/home/#{u['id']}/.ssh/authorized_keys" do
      action :create
      owner  u['id']
      mode   '0600'
      content u['authorized_keys']
    end
  end
end
