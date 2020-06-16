class UsersController < ApplicationController


get "/users/:user_id" do
   #show their name
   @user = User.find_by(id: params[:user_id])
   #binding.pry
   #working
   erb :"users/show"
end

  #or a show page
  #authorization
  #forms for the orders
  #7 RESTful routes on basket model


end