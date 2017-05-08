class User < ApplicationRecord
  has_many :articles

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password

  # BCrypt
  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return false if user.nil?
    user.password == password
  end
end
