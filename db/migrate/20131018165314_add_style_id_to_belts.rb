class AddStyleIdToBelts < ActiveRecord::Migration
  def change
    add_reference :belts, :style, index: true
  end
end
