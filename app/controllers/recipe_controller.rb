class RecipeController < ApplicationController

    def created
        #needs to use scope method .created from recipe class and redirect to
        #show utilizing this scope method
    end 

    def index
        if params[:user_id]
            session[:user_id] = params[:user_id]
            @all_recipes = Recipe.all
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
        redirect_to "/recipes/#{@recipe.id}"
    end
    

    def show
        @recipe = current_user.recipes
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
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

    def recipe_params
        params.require(:recipe).permit(:name)
    end
    
end
