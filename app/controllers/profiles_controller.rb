class ProfilesController < ApplicationController


get "/profile/:user_id" do
   #show their name
   logged_in_user_id = session[:user_id]
   @user = User.find_by(id: logged_in_user_id)
#   binding.pry
   erb :"profiles/show"
end

  #or a show page
  #authorization
  #forms for the orders
  #7 RESTful routes on basket model


end