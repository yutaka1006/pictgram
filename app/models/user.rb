class User < ApplicationRecord
    validates :name, presence: true,length: {maximum:15}
    validates :email, presence: true
    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :password, presence: true,length: { minimum: 8, maximum: 32}
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/
    
    has_secure_password
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    has_many :comments
    has_many :comments_topics, through: :comments, source: 'topic'
end

    