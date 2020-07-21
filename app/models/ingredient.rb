class Ingredient < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes

    validates :name, length: { maximum: 15 }

    scope :low_cal_ingredients, -> { self.where("calories < '50'") }

end
