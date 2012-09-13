#!/bin/sh

#curl -L http://opscode.com/chef/install.sh | sudo bash
rm -rf /var/chef-solo
mkdir -p /var/chef-solo
cd /var/chef-solo
wget https://github.com/krivospitsky/FirstHostAdmin-chef/tarball/master
tar xvfz master
mv krivospitsky-FirstHostAdmin-chef-*/* ./
rm -rf ./krivospitsky-FirstHostAdmin-chef-*
rm -f master
chef-solo  -c /var/chef-solo/solo.rb -j /var/chef-solo/node.json

mkdir -p /home/webmaster/projects/
cd /home/webmaster/projects/
git clone git@github.com:krivospitsky/FirstHostAdmin.git
mkdir -p /home/webmaster/projects/FirstHostAdmin/shared
cd /home/webmaster/projects/FirstHostAdmin
chown webmaster:webmaster /home/webmaster/projects/ -R
sudo -u webmaster bundle install
sudo -u webmaster rake assets:precompile
/etc/init.d/unicorn-FirstHostAdmin start