class Recipe < ApplicationRecord
    # scope :created, { where (ingredients: true ) }
    belongs_to :user
    has_many :ingredients
    validates :name, uniqueness: true


end
