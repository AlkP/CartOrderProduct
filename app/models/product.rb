class Product < ApplicationRecord
  has_many :orders

  validates :name, :price, presence: true
end
