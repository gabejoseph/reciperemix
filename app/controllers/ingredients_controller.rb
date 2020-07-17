class IngredientsController < ApplicationController
    
    def index
        @ingredients = Ingredient.all
    end 

    def new 
        @ingredients = Ingredient.new(recipe_id: params[:recipe_id])
    end 

    def create
        binding.pry
        @ingredient = Ingredient.create(ingredient_params)
        binding.pry
        redirect_to recipe_path
    end
    

    def show
    end

    def edit

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
        params.require(:ingredient).permit(:name, :calories, :fats, :protein, :carbohydrates, :recipe_id)
    end

end
