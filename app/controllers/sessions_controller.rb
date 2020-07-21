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
        binding.pry
        @user = User.find_by(username: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_recipe_index_path(@user)
        else 
            render :new
        end 
    end

    # def create
    #     @user = User.find_or_create_from_auth_hash(auth_hash)
    #     self.current_user = @user
    #     redirect_to '/'
    # end

    def destroy
    end
    
    protected
    
    def auth_hash
        request.env['omniauth.auth']
    end

end
