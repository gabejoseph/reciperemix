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
    end 

    def update
        binding.pry
        # if params[:content].empty?
        #     redirect to "/recipes/#{params[:id]}/edit"
        # end 
        # @epiphanies = Epiphany.find_by(id: params[:id])
        # @epiphanies.update(content: params[:content])
        # @epiphanies.save
        # redirect to "/epiphanies/#{@epiphanies.id}"
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
