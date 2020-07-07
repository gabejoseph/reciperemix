class User < ApplicationRecord
    has_secure_password
    has_many :remixes
    has_many :recipes
    has_many :ingredients, through: :remixes
    has_many :ingredients, through: :recipes


end
