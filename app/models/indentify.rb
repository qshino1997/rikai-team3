class Indentify < ApplicationRecord
    belongs_to :book
    belongs_to :catogary
    has_many :borrows
end
