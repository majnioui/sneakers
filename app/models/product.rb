class Product < ApplicationRecord
    has_one_attached :image
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :order_items, dependent: :destroy
    has_rich_text :description
end
