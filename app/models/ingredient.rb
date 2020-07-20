class Ingredient < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes

    validates :name, length: { maximum: 15 }

end
