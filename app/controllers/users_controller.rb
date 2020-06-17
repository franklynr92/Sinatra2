class UsersController < ApplicationController


get "/users/:user_id" do
   #show their name
   @user = User.find_by(id: params[:user_id])
   #binding.pry
   #working
   erb :"users/show"
end

get '/users/:id/baskets' do
  binding.pry
  if logged_in?
      current_user
      @baskets = find_baskets
  #@baskets = Basket.find_by(user_id: current_user.id)
  erb :"users/index_custom"
end
end

  #or a show page
  #authorization
  #forms for the orders
  #7 RESTful routes on basket model


end