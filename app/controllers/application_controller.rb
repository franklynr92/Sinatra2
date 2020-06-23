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
        !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect?
      if !logged_in?
          @error = "Login to access page"
          redirect to "/"
      end
    end

    def current_basket
        @current_basket = Basket.all.where(user_id: current_user.id)
    end

     def created_message
            <<-HEREDOC 
        This basket name has been taken.!! 
            Please pick another name!!
            HEREDOC
        end

        def deleted_message
            <<-HEREDOC 
        This basket has been deleted. 
        Would you like to create another?!!
            HEREDOC
        end

        def updated_message
            <<-HEREDOC 
        This basket has been updated. 
        What would you like to do now?
            HEREDOC
        end
end
 

end
