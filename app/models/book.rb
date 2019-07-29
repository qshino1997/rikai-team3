class Book < ApplicationRecord
    mount_uploader :picture, AttachmentUploader
    has_many :catogaries
    has_many :indentities
    has_many :borrows
    has_many :histories
    validates :mota, presence: { message: " không được để  trống" } 
    validates :tieude, presence: { message: " không được để  trống" } 
    validates :tacgia, presence: { message: " không được để  trống" } 
    validates :namxuatbang, presence: { message: " không được để  trống" } 
    validates :gia, presence: { message: " không được để  trống" } 

end
