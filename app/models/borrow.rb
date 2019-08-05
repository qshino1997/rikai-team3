class Borrow < ApplicationRecord
    has_many :borrowDetails
    belongs_to :indentify
    belongs_to :book
    belongs_to :user
    has_many :history_borrows

    validates :indentify_id, presence: { message: " Sách này đã được mượn" }, uniqueness: { case_sensitive: false ,message: " này đã tồn tại"  }
end

