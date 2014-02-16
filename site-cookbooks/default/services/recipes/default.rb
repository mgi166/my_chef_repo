#
# Cookbook Name:: services
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service_list = <<-SERVICES.lines.map(&:strip)
          auditd
          blk-availability
          mdmonitor
          iscsid
          iscsi
          ip6tables
          lvm2-monitor
          netfs
          nfs
          nfslock
          restorecond
          SERVICES

service_list.each do |srv|
  service srv do
    action [:disable, :stop]
  end
end
