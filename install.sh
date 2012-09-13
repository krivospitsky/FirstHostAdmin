#!/bin/sh

#curl -L http://opscode.com/chef/install.sh | sudo bash
rm -rf /home/webmaster/projects/FirstHostAdmin
mkdir -p /home/webmaster/projects/
cd /home/webmaster/projects/
git clone git@github.com:krivospitsky/FirstHostAdmin.git
mkdir -p /home/webmaster/projects/FirstHostAdmin/shared
chown webmaster:webmaster /home/webmaster/projects/FirstHostAdmin/ -R

chef-solo -c /home/webmaster/projects/FirstHostAdmin/chef-solo/solo.rb -j /home/webmaster/projects/FirstHostAdmin/chef-solo/node.json

sudo -u webmaster bundle install
sudo -u webmaster rake assets:precompile
/etc/init.d/unicorn-FirstHostAdmin start