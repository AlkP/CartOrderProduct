require 'securerandom'

class Cart < ApplicationRecord
  validates :guid, :status, presence: true

  enum status: [:open, :payment, :closed]

  def initialize
    super
    @guid = SecureRandom.base64(256).gsub('/','').gsub('+','')[1..256]
    @status = 0
  end
end
