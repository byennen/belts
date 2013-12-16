class AddCauseUrl < ActiveRecord::Migration
  def up
    add_column :causes, :url, :string
  end
  def down
    remove_column :causes, :url
  end
end
