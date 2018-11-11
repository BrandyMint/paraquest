class ImageUploader < ApplicationUploader
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    "/images/fallback/#{model.class.to_s.underscore}/" + [version_name, "default.png"].compact.join('_')
  end
end
