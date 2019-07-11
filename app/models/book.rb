class Book < ApplicationRecord
    has_many :catogaries
    has_many :indentities
    mount_uploader :picture, PictureUploader
    validate  :picture_size

    private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
