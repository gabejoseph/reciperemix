class IngredientsController < ApplicationController
    
    def index
        @ingredients = Ingredient.all
    end 

    def new 
        @ingredients = Ingredient.new
    end 

    def create 
        @ingredient = Ingredient.create(ingredient_params)
        redirect_to recipe_ingredients_path(@ingredient)
    end
    

    def show
        
    end

    def edit
        binding.pry
        
    end 

    def update
        
    end 

    def destroy
        if current_user
            session.delete :user_id
            redirect_to '/'
        end 
    end
    
    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :calories, :fats, :protein, :carbohydrates)
    end

end
