class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_one_attached :image
    has_many :products
end
