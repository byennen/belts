class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  validates :name, :address_1, :email, :city, :state, :zip_code, presence: true

  attr_accessor :stripe_card_token

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def create_charge
    Stripe::Charge.create(amount: 400, currency: "usd", card: stripe_card_token, description: email)
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end
end