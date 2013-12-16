class CreateCauses < ActiveRecord::Migration
  def up
    create_table :causes do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.string :belt_color
      t.string :buckle_color
      t.string :image
      t.boolean :status, default: true
      t.timestamps
    end
  end
  def down
    drop_table :causes
  end
end
