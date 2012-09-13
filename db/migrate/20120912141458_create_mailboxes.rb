class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.string :user_name
      t.string :password
      t.integer :gid
      t.integer :uid
      t.integer :domain_id

      t.timestamps
    end
  end
end
