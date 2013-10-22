class AddPriceToBelts < ActiveRecord::Migration
  def change
    add_column :belts, :price_cents, :integer, :default => 0, :null => false
    add_column :belts, :price_currency, :string, :default => "USD", :null => false
  end
end
