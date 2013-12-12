class OrderReport

  include Datagrid

  scope do
    Order.order(id: :desc)
  end

  filter :id
  filter :name
  filter :coupon_code

  column(:id, header: "Order Number")
  column(:name)
  column(:created_at, header: "Order date") { |order| order.created_at.strftime("%m/%d/%Y - %H:%M:%S") }
  column(:price, order: :price_cents) { |order| order.complete_order_price(order.price_cents, order.price_currency) }
  column(:coupon_code, header: "Coupon", html: true) do |order|
    if order.coupon_code.blank?
      "(none)"
    else      
      link_to "$ #{order.discount} - #{order.coupon_code}", admin_coupons_path("coupon_report[code]"=>order.coupon_code), title: "See coupon details"
    end
  end
  column(:action, html: true) do |order|
    link_to "Order Details", admin_order_path(order), class: "btn btn-mini"
  end

end