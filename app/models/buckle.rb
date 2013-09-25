class Buckle < ActiveRecord::Base
  mount_uploader :image, BuckleUploader
end
