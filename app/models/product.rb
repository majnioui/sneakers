class Product < ApplicationRecord
    has_one_attached :image
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :order_items, dependent: :destroy
    has_rich_text :description
    has_one :action_text_rich_text, class_name: 'ActionText::RichText', as: :record
    validates :category_id, presence: true
    belongs_to :category
end
