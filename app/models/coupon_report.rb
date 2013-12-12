class CouponReport

  include Datagrid

  scope do
    Coupon.order(id: :desc)
  end

  filter :code
  filter :discount_type, :enum, select: Coupon::COUPON_TYPES   

  column :code  
  column(:discount, order: :discount_percentage) { |coupon| coupon.discount_type=='fixed' ? coupon.discount : "#{coupon.discount_percentage} %" }
  column(:usage, html: true, order: "(SELECT COUNT(*) FROM orders WHERE orders.coupon_code = coupons.code)") do |coupon|      
    if coupon.usage > 0
      link_to "#{coupon.usage} times",admin_orders_path('order_report[coupon_code]'=>coupon.code)
    else
      "(none)"
    end
  end
  column(:start_date)
  column(:end_date)
  column(:actions, html: true) do |coupon|
    html = link_to :edit, edit_admin_coupon_path(coupon), class: "btn btn-small"
    html += link_to :delete, admin_coupon_path(coupon), class: "btn btn-small btn-danger", method: :delete
    html
  end


end