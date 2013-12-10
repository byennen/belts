class Coupon < ActiveRecord::Base

  COUPON_TYPES = %w(fixed percentage)

  validates :code, presence: true, uniqueness: true
  validates :type, inclusion: { in: COUPON_TYPES }
  validates :frequency, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :discount_percentage, 
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 },
    if: Proc.new { |coupon| coupon.type == 'percentage' }
  validates :discount_cents, 
    numericality: { only_integer: true, greater_than_or_equal_to: 1 },
    if: Proc.new { |coupon| coupon.type == 'fixed' }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.generate_code
    begin
      code = SecureRandom.urlsafe_base64[0,8]
    end while Coupon.where(code: code).exists?
    code
  end

end
