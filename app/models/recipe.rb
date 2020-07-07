class Recipe < ApplicationRecord
    belongs_to :user
    has_many :remixes, through: :users
    has_many :ingredients


end
