class User < ApplicationRecord
    has_secure_password
    
    has_many :recipes
    has_many :ingredients, through: :recipes

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

    # def self.create_with_omniauth(auth)
    #     create! do |user|
    #       user.provider = auth["provider"]
    #       user.uid = auth["uid"]
    #       user.name = auth["info"]["name"]
    #     end
    # end


end
