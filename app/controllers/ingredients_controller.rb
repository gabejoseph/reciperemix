class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end 

    def new 
        @ingredients = Ingredient.new
    end 

    def create
        # user = User.create(user_params)
        # if user.valid?
        #     session[:user_id] = user.id
        #     redirect_to user
        # else 
        #     render :new
        # end 

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
        params.require(:ingredients).permit(:name, :calories, :recipe_id, :remix_id)
    end
end
