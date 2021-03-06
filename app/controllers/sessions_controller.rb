require 'pry'
class SessionsController < ApplicationController

    def create
        if request.env["omniauth.auth"]
            @user = User.find_or_create_by(username: request.env["omniauth.auth"][:info][:name]) do |u|
                u.password = request.env["omniauth.auth"][:info][:email]
                u.email = request.env["omniauth.auth"][:info][:email]
            end 
            session[:user_id] = @user.id
            redirect_to recipe_index_path(@user)
        else 
            @user = User.find_by(username: params[:name])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to recipe_index_path(@user)
            else 
                render :new
            end
        end 
    end  
    
    protected
    
    def auth_hash
        request.env['omniauth.auth']
    end

end
