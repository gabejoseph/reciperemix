class RecipeController < ApplicationController

    def created
        #needs to use scope method .created from recipe class and redirect to
        #show utilizing this scope method
    end 

    def index
        @recipes = Recipe.all
    end 

    def new 
        @recipe = Recipe.new
    end 
 
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id
        @recipe.save
        redirect_to recipe_ingredients_path(@recipe.id)
    end
    

    def show
        @recipe = Recipe.all
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

    def recipe_params
        params.require(:recipe).permit(:name, :user_id)
    end
    
end
