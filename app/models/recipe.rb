class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :ingredient
    belongs_to :category
    
    validates :name, uniqueness: true

end
