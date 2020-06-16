require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
      set :public_folder, 'public'
      enable :sessions
      set :session_secret, "secret"
      set :views, 'app/views'
  end

#session hijacking


get "/" do
    erb :"hello"
end

  
  helpers do
    def logged_in?
      #just returns true or false if someone is logged in
        !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
end
 

end
