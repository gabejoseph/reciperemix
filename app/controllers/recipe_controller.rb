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
        binding.pry
        @recipe = Recipe.create
        @recipe.user_id = current_user.id
        @recipe.save
        binding.pry
        redirect_to recipe_ingredients_path
    end
    

    def show

        # if session[:user_id]
        #     @user = User.find(params[:id])
        # else 
        #     redirect_to '/'
        # end 
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

end
