#
# Author:: Adam Jacob <adam@opscode.com>
# Cookbook Name:: unicorn
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

gem_package "unicorn"


app_name = 'FirstHostAdmin'
dir = "/home/webmaster/projects/#{app_name}"

unicorn_config "/etc/unicorn/#{app_name}.rb" do
  listen({ "#{dir}/shared/unicorn.sock" => { :tcp_nodelay => true, :backlog => 100 } })
  pid "#{dir}/shared/unicorn.pid"
  working_directory "#{dir}"
  worker_timeout 60
  preload_app true
  worker_processes 2
  before_fork 'sleep 1'
end

#стартовый скрипт
template "/etc/init.d/unicorn-#{app_name}" do
  source "unicorn.erb"
  mode "0755"
  owner 'webmaster'
  group 'webmaster'
  variables({:app=>app_name})
end


service "unicorn-#{app_name}" do
  supports :restart => true, :reload => true
  action [ :enable]
#  action [ :enable, :start ]
end

template "/etc/logrotate.d/unicorn-#{app_name}" do
  source "logrotate.erb"
  cookbook "unicorn"
  owner "root"
  group "root"
  mode "0644"
  variables({:app=>app_name})
end

