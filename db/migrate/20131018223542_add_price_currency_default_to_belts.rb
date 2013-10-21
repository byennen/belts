class AddPriceCurrencyDefaultToBelts < ActiveRecord::Migration
  def change
  	change_column :belts, :price_currency, :string, :default => "USD", :null => false
  	change_column :buckles, :price_currency, :string, :default => "USD", :null => false
  end
end
