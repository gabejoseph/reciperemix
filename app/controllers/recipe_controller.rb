class RecipeController < ApplicationController

    def created
        #needs to use scope method .created from recipe class and redirect to
        #show utilizing this scope method
    end 

    def index
        if params[:user_id]
            session[:user_id] = params[:user_id]
            @recipes = Recipe.all
            @user_recipes = Recipe.all.find_by(user_id: params[:user_id])
        else 
            redirect_to '/'
        end 
        # @user_recipes = current_user.recipes
    end 

    def new 
        @recipe = Recipe.new
    end 
 
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = session[:user_id]
        @recipe.save
        binding.pry
        redirect_to ingredients_path
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
