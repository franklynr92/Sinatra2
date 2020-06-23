class SessionsController < ApplicationController

get "/signup" do
  erb :"sessions/signup"
end

get "/login" do
    erb :"sessions/login"
end

post "/signup" do  
  user = User.new(params[:user])
  if user.save
     session[:user_id] = user.id
    redirect to "/users/#{user.id}"
  else
    erb :"sessions/signup"
  end
end


post "/login" do
    user = User.find_by(user_name: params[:user][:user_name])
    if !user || !user.authenticate(params[:user][:password])
        @error = "Invalid credentials"
        erb :"/sessions/login"
    else 
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
    end
end

get '/logout' do
    session[:user_id] = nil
    redirect to "/"
end


end