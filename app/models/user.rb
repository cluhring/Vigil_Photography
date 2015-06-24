class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :first_name, :last_name, presence: true, length: { maximum: 25 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 50 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, }
  validates :password, presence: true,
                       length: { minimum: 6 }
  has_secure_password
end
