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
    
    private

    def user_params
        params.require(:recipe).permit(:name, :ingredients, :user_id)
    end
    
end
