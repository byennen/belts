class AddCouponsToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :coupon_code, :string
    add_column :orders, :coupon_description, :string
    add_column :orders, :coupon_cents, :integer, :default => 0
    add_column :orders, :coupon_currency, :string, :default => "USD"
    add_index :orders, :coupon_code
  end
  def down
    remove_column :orders, :coupon_code
    remove_column :orders, :coupon_description
    remove_column :orders, :coupon_cents
    remove_column :orders, :coupon_currency
  end
end
