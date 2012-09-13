class Domain < ActiveRecord::Base
  attr_accessible :alias, :fqdn, :user_id, :mail_path
  belongs_to :user
  has_many :mailbox

  def self.gen_apache_cfg
	filename = 'app\views\domains\apache_host.cfg.erb'
	erb = ERB.new(File.read(filename))
	erb.filename = filename
#	File.open('/etc/apache2/sites', 'w') {|f| f.write(erb.result) }
	File.open('d:/tmp/1.cfg', 'w') {|f| f.write(erb.result) }
	#Domain.all
  end

  def self.gen_nginx_cfg
  end
end
