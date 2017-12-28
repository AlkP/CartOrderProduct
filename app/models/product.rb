class Product < ApplicationRecord
  has_many :orders

  validates :name, :price, presence: true

  default_scope { order(created_at: :desc) }
end
