class Guest < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name, :message, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX }
end
