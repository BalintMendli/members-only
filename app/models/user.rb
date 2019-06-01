class User < ApplicationRecord
  has_many :posts

  before_create :set_remember_digest

  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def set_remember_digest
      self.remember_digest = User.digest(User.new_token)
    end
end