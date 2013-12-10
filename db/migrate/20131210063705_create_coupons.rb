class CreateCoupons < ActiveRecord::Migration
  def up
    create_table :coupons do |t|
      t.string :type
      t.string :code
      t.integer :frequency, :default => 1
      t.boolean :status

      t.integer :discount_percentage, :default => 0
      t.integer :discount_cents, :default => 0
      t.integer :discount_currency, :default => "USD"

      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :coupons, :code
  end
  def down
    drop_table :coupons
  end
end
