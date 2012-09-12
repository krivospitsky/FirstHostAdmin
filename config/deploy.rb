set :scm, :git
set :repository,  "git@github.com:krivospitsky/FirstHostAdmin.git" # Путь до вашего репозитария. Кстати, забор кода с него происходит уже не от вас, а от сервера, поэтому стоит создать пару rsa ключей на сервере и добавить их в deployment keys в настройках репозитария.
set :branch, "master" # Ветка из которой будем тянуть код для деплоя.
set :deploy_via, :remote_cache # Указание на то, что стоит хранить кеш репозитария локально и с каждым деплоем лишь подтягивать произведенные изменения. Очень актуально для больших и тяжелых репозитариев.
set :keep_releases, 5

set :application, "FirstHostAdmin"
set :rails_env, "production"

set :deploy_to, "/home/webmaster/projects/#{application}"
set :use_sudo, false
set :unicorn_conf, "/etc/unicorn/FirstHostAdmin.rb"
set :unicorn_pid, "#{deploy_to}/shared/unicorn.pid"

set :user, "webmaster"

role :web, "192.168.1.98"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.98"                          # This may be the same as your `Web` server
role :db,  "192.168.1.98", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
 after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
=begin
  desc "Link configs from shared"
  task :link_config, :roles => [:web, :db, :app] do
    cmd = []
    %w(database.yml).each do |config|
      cmd << "cp #{deploy_to}/shared/#{config} #{release_path}/config/#{config}"
    end
    cmd << "ln -s #{shared_path}/uploads #{release_path}/public/uploads"

    run cmd.join(' && ')
  end

  after "deploy:update_code" do
    link_config
  end
=end

  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
  end

  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
end
