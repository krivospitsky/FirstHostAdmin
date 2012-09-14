#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright 2012, tvm
#
# All rights reserved - Do Not Redistribute
#

%w{zlib1g-dev mc screen rsync phpmyadmin phppgadmin roundcube mysql-server apache22-mpm-itk}.each do |package_name|
  package package_name do
    action :install
  end
end

=begin
%w{irqbalance}.each do |service_name|
  service service_name do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
  end
end

=end
