class CreateBelts < ActiveRecord::Migration
  def change
    create_table :belts do |t|
      t.string :name
      t.string :hex_color
      t.string :image

      t.timestamps
    end
  end
end
