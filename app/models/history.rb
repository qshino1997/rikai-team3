class History < ApplicationRecord
    belongs_to :book
    belongs_to :indentify
    belongs_to :user
end