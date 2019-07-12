class Borrow < ApplicationRecord
    has_many :borrowDetails
    belongs_to :indentify
end
