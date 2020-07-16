require 'pry'
class UsersController < ApplicationController
    protect_from_forgery

    def index
        @user = User.all
    end 

    def signup 
        if logged_in?
            redirect_to recipe_index_path
        else 
            @user = User.new
            render :new
        end 
    end 

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to recipe_index_path
        else 
            render :new
        end 
    end

    def destroy
        if current_user
            session.delete :user_id
            redirect_to '/login'
        else 
            redirect_to '/'
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

end
