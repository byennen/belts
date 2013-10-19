class BuckleUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave


  process :convert => 'png'
  process :tags => ['post_picture']

  # Create different versions of your uploaded files:
  version :small do
    process :scale => [50, 50]
  end

  version :medium do
    process :scale => [150]
  end

  version :large do
    process :scale => [770, 477]
  end

end
