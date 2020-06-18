class SessionsController < ApplicationController

get "/signup" do
  erb :"sessions/signup"
end

get "/login" do
    erb :"sessions/login"
end

post "/signup" do 
    
  user = User.new(params[:user])
  #user.errors.full_messages
  #binding.pry
  if user.save
  session[:user_id] = user.id
 
  redirect to "/users/#{user.id}"
  else
    erb :"sessions/signup"
end
end


post "/login" do
    #binding.pry
    user = User.find_by(user_name: params[:user][:user_name])
    if !user
        @unknown = "No user found, create an account"
        erb :"sessions/signup"
    else 
        if user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            #binding.pry
            redirect to "/users/#{user.id}"
        else
            @error = "Invalid credentials"
            erb :"/hello"
        end
        # binding.pry
end
end

get '/logout' do
    session[:user_id] = nil
    redirect to "/"
end


end