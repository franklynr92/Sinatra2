require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "carcollection"
end

#session hijacking

helpers do
    def logged_in?
        !!session[:email]
    end

    def login(email)
       session[:email] = email
    #else 
     #   redirect '/login'
    #end
    end

    def logout!
        session.clear
    end
end

  get "/" do
    erb :hello
  end

  get "/login" do
    erb :login
  end

  get "/signup" do
    erb :signup
  end

  post "login" do
    @user = User.find_by_id(params[:id])
    erb :profile
  end

  post "/profile" do 
    @user = User.create
    @user.name = params[:name]
    @user.email = params[:email]
    @user.user_name = params[:user_name]
    @user.password = params[:password]
    session[:user_id] = @user.id
    erb :profile
  end

  get "/profile/:id" do
   #show their name
    puts params
    params[:name]
    params[:user]
    params[:password]
    erb :profile
  end

  get '/order' do
    erb :order
  end

end
