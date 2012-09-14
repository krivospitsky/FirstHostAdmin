# This migration comes from saphira (originally 20110909143712)
class CreateSaphiraImageVariants < ActiveRecord::Migration
  def change
    create_table :saphira_image_variants do |t|
      t.string :name
      t.string :description
      t.string :manipulation

      t.timestamps
    end
  end
end
