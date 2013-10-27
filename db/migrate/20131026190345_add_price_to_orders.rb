class AddPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price_cents, :integer, :default => 0, :null => false
    add_column :orders, :price_currency, :string, :default => "USD", :null => false
    add_column :orders, :cause, :string
  end
end
