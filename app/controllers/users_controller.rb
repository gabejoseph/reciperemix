require 'pry'
class UsersController < ApplicationController

    def index
        @user = User.all
    end 

    def new 
        @user = User.new
    end 

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user
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
        params.require(:user).permit(:name, :password, :email)
    end

end
