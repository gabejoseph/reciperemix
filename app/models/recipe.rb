class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :ingredient
    
    validates :name, uniqueness: true

end
