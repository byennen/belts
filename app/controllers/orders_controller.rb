class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]

  def new
    if @cart.line_items.empty?
      redirect_to root_url, notice: 'Your cart is empty'
      return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)    
    @order.coupon_cents = Coupon.get_discount(@order.coupon_code, @order.total_price(@cart)).cents
    @order.price_cents = @order.total_price(@cart) - @order.coupon_cents 

    respond_to do |format|
      if @order.save && @order.create_charge
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        Mailer.order_mailer(@order, @cart).deliver
        format.html { redirect_to root_url, notice: 'Thank you for your order.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address_1, :address_2, :city, :state, :zip_code, :email, :stripe_card_token, :price_cents, :coupon_code, :coupon_discount)
    end
end
