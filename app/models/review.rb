class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_rich_text :body
end
