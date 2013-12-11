class CouponsController < ApplicationController

  def check_coupon    
    total_cents = params[:total].to_i
    discount = Coupon.get_discount(params[:code], total_cents)
    total = Money.new(total_cents - discount.cents, "USD")
    render json: { cents: discount.cents, discount: discount.to_s, total: total.to_s}
  end

end