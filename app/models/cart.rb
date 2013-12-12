class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(belt_id, buckle_id)
    current_item = line_items.find_by(belt_id: belt_id, buckle_id: buckle_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(belt_id: belt_id, buckle_id: buckle_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_buckle_price + item.total_belt_price }
  end

  def final_price(coupon_code=nil)
    self.total_price - Coupon.get_discount(coupon_code, self.total_price.cents)
  end

end
