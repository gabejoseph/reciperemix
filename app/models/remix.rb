class Remix < ApplicationRecord
    has_many :recipes, through: :users
    belongs_to :user
    has_many :ingredients

    validates :ingredients, presence: true

end
