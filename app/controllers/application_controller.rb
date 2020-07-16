class ApplicationController < ActionController::Base
  protect_from_forgery

    # configure do
    #     enable :sessions
    #     set :session_secret, "ftwitter_secret"
      #   set :public_folder, 'public'
      #   set :views, 'app/views'
    #   end
    
      # get "/" do
      #   erb :index
      # end
    
    
    def logged_in?
        !!current_user
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

end
