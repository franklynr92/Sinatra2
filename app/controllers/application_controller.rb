require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
   # + 'orders'
    #set :views, 'app/views/orders'
    enable :sessions
    set :session_secret, "carcollection"
    #set :views, Proc.new { File.join(root, "templates") }
    set :views, 'app/views'
end

#session hijacking


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
    session[:user_name] = @user.user_name
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

  #or a show page
  #authorization
  #forms for the orders
  #7 RESTful routes on basket model

  helpers do
    def logged_in?
        !!session[:user_name]
    end

    def login(user_name)
       session[:user_name] = user_name
    #else 
     #   redirect '/login'
    #end
    end

    def logout!
        session.clear
    end
end

 

end
