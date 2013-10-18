class AddPriceToBuckles < ActiveRecord::Migration
  def change
    add_column :buckles, :price_cents, :integer, :default => 0, :null => false
    add_column :buckles, :price_currency, :string, :null => false
  end
end
