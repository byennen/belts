class CouponReport

  include Datagrid

  scope do
    Coupon.order(id: :desc)
  end

  filter :code
  filter :discount_type, :enum, select: Coupon::COUPON_TYPES  

  column :code  
  column(:discount) { |coupon| coupon.discount_type=='fixed' ? coupon.discount : "#{coupon.discount_percentage} %" }
  column(:start_date)
  column(:end_date)
  column(:actions, html: true) do |coupon|
    html = link_to :edit, edit_admin_coupon_path(coupon), class: "btn btn-small"
    html += link_to :delete, admin_coupon_path(coupon), class: "btn btn-small btn-danger", method: :delete
    html
  end


end