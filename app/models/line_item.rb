class LineItem < ActiveRecord::Base
  belongs_to :buckle
  belongs_to :belt
  belongs_to :cart
  belongs_to :order

  def total_price
    buckle = buckle.price_cents * quantity
    belt = belt.price_cents * quantity
    buckle + belt
  end
end
