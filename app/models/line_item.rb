class LineItem < ActiveRecord::Base
  belongs_to :buckle
  belongs_to :belt
  belongs_to :cart
end
