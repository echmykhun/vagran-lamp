#
# Cookbook Name:: che-apache2
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'apache2' do
  action :install
end

template '/etc/apache2/sites-enabled/test.conf' do
  source 'vhost.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  path '/etc/apache2/sites-enabled/test.conf'
end