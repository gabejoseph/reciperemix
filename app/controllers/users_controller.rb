require 'pry'
class UsersController < ApplicationController

    def index
        @user = User.all
    end 

    def signup 
        @user = User.new
        render :new
    end 

    def login 
        render 'users/login'
    end 

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to recipe_index_path
        else 
            render :new
        end 
      end
    

      def show

        if session[:user_id]
            @user = User.find(params[:id])
        else 
            redirect_to '/'
        end 
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
        params.require(:user).permit(:username, :password, :email)
    end

end
