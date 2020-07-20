class RecipeController < ApplicationController

    def created
        #needs to use scope method .created from recipe class and redirect to
        #show utilizing this scope method
    end 

    def index
        if params[:user_id]
            session[:user_id] = params[:user_id]
            @all_recipes = Recipe.all
            @user = current_user.id
        else 
            redirect_to '/'
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
            redirect_to "/recipes/#{@recipe.id}"
        else 
            render :new
        end 
    end
    

    def show
        @recipe = current_user.recipes
        @user = current_user.id
    end

    def edit
        if current_user
            @recipe = Recipe.find_by(id: params[:id])
            @user = User.find_by(id: params[:user_id])
        else 
            redirect_to '/'
        end 
    end 

    def update
        @recipe = Recipe.find_by(id: params[:format])
        @recipe.update(recipe_params)
        @recipe.save
        redirect_to user_recipe_path(id: @recipe.id, user_id: current_user.id)
    end 

    def destroy
        if current_user
            @recipe = Recipe.find_by(id: params[:id]).destroy
            redirect_to user_recipe_path(user_id: current_user.id)
        end 
    end
    
    private

    def recipe_params
        params.require(:recipe).permit(:name, :content)
    end
    
end
