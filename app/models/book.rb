class Book < ApplicationRecord
    has_many :catogaries
    has_many :indentities
end
