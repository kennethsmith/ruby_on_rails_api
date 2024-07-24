class User < ApplicationRecord
    has_secure_password
    has_many :prompts
    
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
    validates :image, presence: true
  end