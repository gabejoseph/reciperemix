class Ingredient < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes
    belongs_to :recipe
    validates :name, uniqueness: true


end
