require 'pry'
class SessionsController < ApplicationController

    def new 
        if logged_in?
            @user = current_user.id
            redirect_to user_recipe_index_path(@user)
        else 
            render :new
        end 
    end 

    def create
        @user = User.find_by(username: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_recipe_index_path(@user)
        else 
            render :new
        end 
      end

    def destroy
    end

end
