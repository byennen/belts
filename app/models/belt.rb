class Belt < ActiveRecord::Base
  mount_uploader :image, BeltUploader
end
