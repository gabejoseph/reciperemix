class Ingredient < ApplicationRecord
    belongs_to :remix
    belongs_to :recipe
    has_many :users, through: :remixes
    has_many :users, through: :recipes

    validates :calories, :fats, :carbohydrates, :protein, presence: true

end
