class User < ApplicationRecord
 
  has_many :answers,  dependent: :destroy
  has_many :scores,  dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence:   true, length: { maximum: 255 }, uniqueness: { case_sensitive: false },
                    format:     { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
has_secure_password
end
