class UsersController < ApplicationController


get "/users/:user_id" do
   @user = User.find_by(id: params[:user_id])
   erb :"users/show"
end

#users baskets and customized


end