class AddBeltPatternImageToBelts < ActiveRecord::Migration
  def change
    add_column :belts, :belt_pattern_image, :string
  end
end
