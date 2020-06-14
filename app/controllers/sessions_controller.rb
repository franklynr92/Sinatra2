class SessionsController < ApplicationController

get "/signup" do
  erb :"sessions/signup"
end

get "/login" do
    erb :"sessions/login"
end

post "/signup" do 
    
  user = User.create(params[:user])
  user.save
  session[:user_id] = user.id
 # binding.pry
  redirect to "/profile/#{user.id}"
end


post "/login" do
    
    user = User.find_by(user_name: params[:user][:user_name])
    if user == nil
        @unknown = "No user found, create an account"
        erb :"sessions/signup"
    elsif user != nil
    if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        #binding.pry
        redirect to "/profile/#{user.id}"
    else
        @error = "Invalid credentials"
        erb :"hello"
    end
end
end

get '/logout' do
    session[:user_id] = nil
    redirect to "/"
end





end