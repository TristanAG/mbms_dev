class ClassPage < ApplicationRecord
  extend FriendlyId
  friendly_id :class_title, use: :slugged

  has_attached_file :class_photo, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :class_photo, content_type: /\Aimage\/.*\z/

end
