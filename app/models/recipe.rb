class Recipe < ApplicationRecord
    # scope :created, { where (ingredients: true ) }
    belongs_to :user
    belongs_to :ingredient
    
    validates :name, uniqueness: true

    # @current_user = current_user.id
    # scope :user_recipes, -> { self.where(user_id: @current_user) }

end
