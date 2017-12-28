require 'securerandom'

FactoryBot.define do
  factory :cart do
    sequence(:guid) { (SecureRandom.base64(256).delete('/').delete('+')[1..256]).to_s }
    status 0
  end
end
