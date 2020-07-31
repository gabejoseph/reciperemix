class IngredientsController < ApplicationController
    
    def index
        @ingredients = Ingredient.all
        @recipes = current_user.recipes
        @user = current_user
    end 

    def new 
        @ingredients = Ingredient.new
        @recipe = Recipe.all.select{|m| m.user_id == current_user.id}
    end 

    def create 
        @ingredients = Ingredient.new(ingredient_params)
        if !params[:ingredient][:recipes].empty?
            @ingredients.recipes << Recipe.find_by(name: params[:ingredient][:recipes])
        end 
        if @ingredients.valid?
            @ingredients.save!
            redirect_to ingredient_path(@ingredients)
        else 
            @recipe = Recipe.all.select{|m| m.user_id == current_user.id}
            render :new
        end 
    end
    
    def show
        @ingredient = Ingredient.find_by(id: params[:id])
    end

    def edit
        @ingredient = Ingredient.find_by(id: params[:id])
        @user = current_user
        if !logged_in?
            redirect_to '/login'
        else 
            if @ingredient.user_ids.include?(current_user.id)
                render :edit
            else
                redirect_to ingredient_path(@user)
            end 
        end 
    end 

    def update
        @ingredient = Ingredient.find_by(id: params[:id])
        @ingredient.update(ingredient_params)
        redirect_to ingredient_path(@ingredient)
    end 

    def destroy
        if current_user
            Ingredient.find_by(id: params[:id]).destroy
            redirect_to ingredients_path
        end 
    end

    def lowcal
        @user = current_user.id
        @low_cal = Ingredient.low_cal_ingredients
        render :low_cal
    end 
    
    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :calories, :fats, :protein, :carbohydrates)
    end

end
