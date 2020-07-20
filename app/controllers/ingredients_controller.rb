class IngredientsController < ApplicationController
    
    def index
        @ingredients = Ingredient.all
        @recipes = current_user.recipes
    end 

    def new 
        @ingredients = Ingredient.new
        @recipe = Recipe.all.select{|m| m.user_id == current_user.id}
    end 

    def create 
        @ingredient = Ingredient.new(ingredient_params)
        binding.pry
        @ingredient.recipes << Recipe.find_by(name: params[:ingredient][:recipes])
        binding.pry
        @ingredient.save!
        binding.pry
    end
    
    def show
        @ingredient = Ingredient.find_by(id: params[:id])
    end

    def edit
        @ingredient = Ingredient.find_by(id: params[:id])
    end 

    def update
        @ingredient = Ingredient.find_by(id: params[:id])
        @ingredient.update(ingredient_params)
        redirect_to ingredient_path(@ingredient)
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
