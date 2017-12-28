require 'securerandom'

FactoryBot.define do
  factory :cart do
    sequence(:guid) { "#{SecureRandom.base64(256).gsub('/','').gsub('+','')[1..256]}" }
    status 0
  end
end
