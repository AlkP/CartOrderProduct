require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should validate_presence_of(:guid) }
  it { should validate_presence_of(:status) }
end
