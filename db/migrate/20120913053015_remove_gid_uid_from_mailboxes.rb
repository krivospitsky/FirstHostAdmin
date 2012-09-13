class RemoveGidUidFromMailboxes < ActiveRecord::Migration
  def up
    remove_column :mailboxes, :gid
    remove_column :mailboxes, :uid
  end

  def down
    add_column :mailboxes, :uid, :string
    add_column :mailboxes, :gid, :string
  end
end
