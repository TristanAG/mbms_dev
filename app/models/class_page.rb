class ClassPage < ApplicationRecord
  extend FriendlyId
  friendly_id :class_title, use: :slugged

  def should_generate_new_friendly_id?
    class_title_changed?
  end

  has_attached_file :class_photo, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :class_photo, content_type: /\Aimage\/.*\z/

end
