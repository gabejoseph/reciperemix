require 'pry'
class SessionsController < ApplicationController

    def new 
        if logged_in?
            redirect_to recipe_index_path
        else 
            render :new
        end 
    end 

    def create
        @user = User.find_by(username: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to recipe_index_path(@user)
        else 
            render :new
        end 
      end

    def destroy
    end

end
