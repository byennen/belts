class AddStyleIdToBuckles < ActiveRecord::Migration
  def change
    add_reference :buckles, :style, index: true
  end
end
