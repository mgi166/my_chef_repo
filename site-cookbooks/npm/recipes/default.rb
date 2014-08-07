#
# Cookbook Name:: npm
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

npm_package "hubot" do
  path '/var/app'
  action :install_local
end

npm_package "coffee-script" do
  path '/var/app'
  action :install_local
end

npm_package "hubot-hipchat" do
  path '/var/app'
  action :install_local
end
