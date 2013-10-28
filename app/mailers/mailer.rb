class Mailer < ActionMailer::Base
  default from: "no-reply@c4belts.com"

  def order_mailer(order, cart)
    @order = order
    @cart = cart
    mail(to: order.email, subject: 'Thank you for your order! - C4Belts')
  end
end
