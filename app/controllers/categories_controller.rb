class CategoriesController < ApplicationController

    def new 
        @category = Category.new
    end 

    def create 
        binding.pry
        @category = Category.create(category_params)
        # redirect_to '/'
    end 
    
    private

    def category_params
        params.require(:category).permit(:name)
    end

end
