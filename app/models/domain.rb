class Domain < ActiveRecord::Base
  attr_accessible :alias, :fqdn, :user_id, :mail_path
  belongs_to :user
  has_many :mailbox

  FQDN_REGEX = /(?=^.{1,254}$)(^(?:(?!\d+\.|-)[a-zA-Z0-9_\-]{1,63}(?<!-)\.?)+(?:[a-zA-Z]{2,})$)/
  validates :fqdn, :presence => true, :uniqueness => true, :format => FQDN_REGEX
  validates :user_id, :presence => true

  def self.gen_apache_cfg
  	filename = 'app/views/domains/apache_host.cfg.erb'
  	erb = ERB.new(File.read(filename))
  	erb.filename = filename
  	File.open('generated_cfg/apache_sites.conf', 'w') {|f| f.write(erb.result) }
  end

  def self.gen_nginx_cfg
  end
end
