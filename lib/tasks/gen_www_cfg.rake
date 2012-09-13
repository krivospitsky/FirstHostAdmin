namespace :FirstHostAdmin do
	task :gen_www_cfg => [:gen_apache_cfg, :gen_nginx_cfg]

	task :gen_apache_cfg => :environment do
		puts 'Generating apache config'
		Domain.gen_apache_cfg
	end

	task :gen_nginx_cfg => :environment do
		puts 'Generating nginx config'
		Domain.gen_nginx_cfg
	end
end