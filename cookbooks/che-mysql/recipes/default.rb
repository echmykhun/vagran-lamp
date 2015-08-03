#
# Cookbook Name:: che-mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
mysql_root_pwd = "123"
mysql_default_db = "test_db"
mysql_config_file = "/etc/mysql/my.cnf"

package "mysql-server"

service "mysql" do
  service_name "mysql"
  supports [:restart, :reload, :status]
  action :enable
end
execute "/usr/bin/mysqladmin -uroot password #{mysql_root_pwd}" do
  not_if "/usr/bin/mysqladmin -uroot -p#{mysql_root_pwd} status"
end
execute "/usr/bin/mysql -uroot -p#{mysql_root_pwd} -e 'CREATE DATABASE IF NOT EXISTS #{mysql_default_db}'"
execute "/usr/bin/mysql -uroot -p#{mysql_root_pwd} -e \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '#{mysql_root_pwd}' WITH GRANT OPTION;\""
execute "sed -i 's/127.0.0.1/0.0.0.0/g' #{mysql_config_file}" do
  not_if "cat #{mysql_config_file} | grep 0.0.0.0"
end

service "mysql" do
  action :restart
end