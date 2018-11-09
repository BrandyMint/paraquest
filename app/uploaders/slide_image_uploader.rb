class SlideImageUploader < ApplicationUploader
  version :thumb do
    process resize_to_fit: [120, 90]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
