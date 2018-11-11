class SlideImageUploader < ImageUploader
  version :thumb do
    process resize_to_fit: [120, 90]
  end
end
