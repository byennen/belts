class CauseUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'png'
  
  def store_dir
    "causes"
  end

  # Create different versions of your uploaded files:
  version :small do
    process :resize_to_fit => [140, 140]
  end

  version :large do
    process :resize_to_fit => [400, 400]
  end

end
