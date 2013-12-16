class Cause < ActiveRecord::Base

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true    

  mount_uploader :image, CauseUploader

  scope :active, -> { where(status: true) }

end
