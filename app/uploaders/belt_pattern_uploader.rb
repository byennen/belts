class BeltPatternUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave


  process :convert => 'png'
  process :tags => ['post_picture']

  def store_dir
    "patterns/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :small do
    process :scale => [50, 50]
  end

  version :large do
    process :scale => [770, 477]
  end

end
