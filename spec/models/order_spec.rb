require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:cart_id) }
  it { should validate_presence_of :product_id }
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
end
