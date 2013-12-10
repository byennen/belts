class Coupon < ActiveRecord::Base

  COUPON_TYPES = %w(percentage fixed)

  validates :code, presence: true, uniqueness: true, length: { is: 8 }
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

  def self.generate_code
    begin
      code = SecureRandom.urlsafe_base64[0,8]
    end while Coupon.where(code: code).exists?
    code
  end

  before_validation do |coupon|
    coupon.code = Coupon.generate_code if coupon.code.blank?
  end

end
