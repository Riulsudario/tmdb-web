class AvatarUploader < BaseUploader
  version :cropped do
    resize_to_fill(640, 640, ::Magick::CenterGravity)
  end
end
