class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    has_many :ingredients, through: :recipes

    validates :username, :email, presence: true
    validates :password, length: { minimum: 6}

end
