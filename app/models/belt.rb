class Belt < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  mount_uploader :image, BeltUploader
  mount_uploader :belt_pattern_image, BeltPatternUploader

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
