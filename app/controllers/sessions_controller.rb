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
        if !params[:code].nil?
            binding.pry
            @faraday = faraday
            binding.pry
        end 
        @user = User.find_by(username: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_recipe_index_path(@user)
        else 
            render :new
        end 
    end

    def faraday
        Faraday.post("https://example.com/login/oauth/access_token",
        URI.encode_www_form(
            code: params[:code],
            client_id: ENV["4334eabfbacfb5f30399"],
            client_secret: ENV["1b5c025b27a1b569c25be84317d81fbf52789844"],
        ),
        {
            "Content-Type" => "application/x-www-form-urlencoded",
            "Accept" => "application/json"
        })
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
