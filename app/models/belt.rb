class Belt < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  mount_uploader :image, BeltUploader
  mount_uploader :belt_pattern_image, BeltPatternUploader

  def price
    Money.new price_cents, price_currency
  end

  def price=(value)
    value = Money.parse(value) if value.instance_of? String  # otherwise assume, that value is a Money object

    write_attribute :price_cents,    value.cents
    write_attribute :price_currency, value.currency_as_string
  end

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
