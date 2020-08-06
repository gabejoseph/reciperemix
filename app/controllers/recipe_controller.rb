class RecipeController < ApplicationController

    def created
        #needs to use scope method .created from recipe class and redirect to
        #show utilizing this scope method
    end 

    def index
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @recipes = @user.recipes
        else 
            @user = current_user
            @recipes = Recipe.all
        end 
    end 

    def new 
        @recipe = Recipe.new
        @user = current_user
    end 
 
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = session[:user_id]
        @recipe.ingredient_id = Ingredient.find_or_create_by!(name: params[:recipe][:ingredient]).id
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(current_user.id)
        else 
            render :new
        end 
    end
    

    def show
        @recipe = current_user.recipes
        @user = current_user.id
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
        @user = current_user
        if !logged_in?
            redirect_to '/login'
        else 
            if current_user.id == @recipe.user_id
                render :edit
            else
                redirect_to '/'
            end 
        end 
    end 

    def update
        @recipe = Recipe.find_by(name: params[:recipe][:name])
        binding.pry
        @recipe.update(recipe_params)
        @recipe.save
        redirect_to user_recipe_index_path(user_id: current_user.id)
    end 

    def destroy
        if current_user
            @recipe = Recipe.find_by(id: params[:id]).destroy
            redirect_to recipe_path(user_id: current_user.id)
        end 
    end
    
    private

    def recipe_params
        params.require(:recipe).permit(:name, :content)
    end
    
end
