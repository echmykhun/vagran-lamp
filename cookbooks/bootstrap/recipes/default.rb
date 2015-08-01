#
# Cookbook Name:: bootstrap
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "apt-get update" do
  command "apt-get update"
end
package 'mc' do
  action :install
end
package 'htop' do
  action :install
end