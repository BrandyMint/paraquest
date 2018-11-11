class ProfileImageUploader < ImageUploader
  version :thumb do
    process resize_to_fit: [320, 240]
  end
end
