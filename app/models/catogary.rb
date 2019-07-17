class Catogary < ApplicationRecord
    has_many :books
    has_many :indentifies
    validates :tenloai, presence: { message: " không được để  trống" } , length: { maximum: 50 }, uniqueness: { case_sensitive: false ,message: " này đã tồn tại"  }
    
end
