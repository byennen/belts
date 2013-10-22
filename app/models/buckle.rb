class Buckle < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items

  belongs_to :style

  before_destroy :ensure_not_referenced_by_any_line_item

  mount_uploader :image, BuckleUploader

  composed_of :price,
              :class_name => "Money",
              :mapping => [%w(price_cents cents), %w(price_currency currency_as_string)],
              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }


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
