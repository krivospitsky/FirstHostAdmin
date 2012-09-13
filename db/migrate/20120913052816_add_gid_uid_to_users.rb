class AddGidUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gid, :integer
    add_column :users, :uid, :integer
  end
end
