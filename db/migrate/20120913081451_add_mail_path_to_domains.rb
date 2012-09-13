class AddMailPathToDomains < ActiveRecord::Migration
  def change
    add_column :domains, :mail_path, :string
  end
end
