#!/bin/sh

cd /home/webmaster/projects/FirstHostAdmin
git pull

sudo chef-solo -c /home/webmaster/projects/FirstHostAdmin/chef-solo/solo.rb -j /home/webmaster/projects/FirstHostAdmin/chef-solo/node.json

bundle install
/home/webmaster/.rbenv/versions/1.9.3-p194/bin/ruby /home/webmaster/.rbenv/versions/1.9.3-p194/bin/rake assets:precompile:all RAILS_ENV=production RAILS_GROUPS=assets
sudo /etc/init.d/unicorn-FirstHostAdmin restart