class Coupon < ActiveRecord::Base

  COUPON_TYPES = %w(percentage fixed)

  validates :code, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :discount_type, inclusion: { in: COUPON_TYPES }
  validates :frequency, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :discount_percentage, 
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 },
    if: Proc.new { |coupon| coupon.discount_type == 'percentage' }
  validates :discount_cents, 
    numericality: { only_integer: true, greater_than_or_equal_to: 1 },
    if: Proc.new { |coupon| coupon.discount_type == 'fixed' }
  validates :start_date, presence: true
  validates :end_date, presence: true

  composed_of :discount,
              :class_name => "Money",
              :mapping => [%w(discount_cents cents), %w(discount_currency currency_as_string)],
              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

  def usage
    Order.where(coupon_code: self.code).count
  end

  def self.generate_code    
    begin
      length = 4 + Random.rand(16)
      code = SecureRandom.urlsafe_base64[0,length]
    end while Coupon.where(code: code).exists?
    code
  end

  def self.get_discount(code, total)    
    # check exists
    coupon = Coupon.where(code: code, status: true).where(":date >= #{Coupon.table_name}.start_date AND :date <= #{Coupon.table_name}.end_date",date: Time.now.to_date).first
    return Money.new(0,"USD") if coupon.nil?

    # check usage
    times_used = Order.where(coupon_code: code).count
    return Money.new(0,"USD") if times_used >= coupon.frequency

    discount = coupon.discount_type == 'fixed' ? coupon.discount_cents : (coupon.discount_percentage*total/100).round
    Money.new(discount >= total ? total : discount, "USD")
  end

  before_validation do |coupon|
    coupon.code = Coupon.generate_code if coupon.code.blank?
  end

end
