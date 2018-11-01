module UploaderGeometry
  def height
    geometry.second
  end

  def width
    geometry.first
  end

  def geometry
    @geometry ||= ::MiniMagick::Image.open(file.file)[:dimensions]
  rescue => err
    Bugsnag.notify err, metaData: { model_class: model.try(:class), model_id: model.try(:id), file: file.file.to_s }
    [nil, nil]
  end

  def rotate!(grad = 90)
    manipulate! do |img|
      img.rotate grad
      img
    end
    recreate_versions!
    model.save!
  end
end
