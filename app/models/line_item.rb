class LineItem < ActiveRecord::Base
  belongs_to :buckle
  belongs_to :belt
  belongs_to :cart
  belongs_to :order

  def total_buckle_price
    buckle.price * quantity
  end

  def total_belt_price
    belt.price * quantity
  end

  def total_price
    total_buckle_price + total_belt_price
  end

  def total_price_dollars
    money = Money.new(total_price, "USD")
    money.dollars
  end

end
