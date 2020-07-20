class Recipe < ApplicationRecord
    # scope :created, { where (ingredients: true ) }
    belongs_to :user
    belongs_to :ingredient
    
    validates :name, uniqueness: true


end
