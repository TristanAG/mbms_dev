class AddAttachmentClassPhotoToClassPages < ActiveRecord::Migration
  def self.up
    change_table :class_pages do |t|
      t.attachment :class_photo
    end
  end

  def self.down
    remove_attachment :class_pages, :class_photo
  end
end
