class LineItem < ActiveRecord::Base
  belongs_to :belts
  belongs_to :buckles
  belongs_to :cart
end
