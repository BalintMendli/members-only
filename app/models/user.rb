class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def remember
    update_attribute(:remember_digest, User.digest(User.new_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
