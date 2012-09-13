#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
	if node.platform == "debian"
		options  "-t squeeze-backports"
	end
	action :install
end



service "nginx" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable]
#	action [ :enable, :start ]
end


template "/etc/nginx/nginx.conf" do
	source "nginx.conf.erb"	
	owner "root"
	group "root"
	mode 0644
	notifies :reload, resources(:service => "nginx")
	#, :immediately
end
