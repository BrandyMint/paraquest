class ProfileImageUploader < ApplicationUploader
  version :thumb do
    process resize_to_fit: [320, 240]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    "/images/fallback/#{model.class.to_s.underscore}/" + [version_name, "default.png"].compact.join('_')
  end
end
