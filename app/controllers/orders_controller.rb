class OrdersController < ApplicationController



get '/order/:user_id' do
    if logged_in?
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
        erb :"orders/order"
    else    
        @error = "Invalid credentials"
        erb :"hello"
    end
end
   
    
    #if @current_user 
    #erb :"orders/order" 

    #get the name of the user to show, possibly use in conjuction
    #with a logged_in? and pull user name || name from there



post '/show/:user_id' do
    binding.pry
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    #pull name from where
    #currently no data is coming out from "basket" figure out why
    @pick_a_basket = params[:basket]
    #Basket.where(locked: params[:basket])
    #@ingredients_are = Basket.find_by_sql("SELECT ingredients FROM baskets WHERE name = 'Birthday'")
    #Basket.all.select{|ingredients| ingredients.include?(@pick_a_basket)}
    ingredients_are = Basket.find_by_sql("SELECT ingredients FROM baskets WHERE name = '#{@pick_a_basket}'")
    @pick_an_ingredient = ingredients_are.first.ingredients
    #@ingredients_are
    #Basket.find_by_name(@pick_a_basket)
    
    #Basket.find_by(:ingredients => @pick_a_basket => :id)
    
    #find ingredients by their id that is equal to params[:basket] id
    erb :"orders/show"
end

get '/display/basket/:user_id' do
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    erb :"orders/display_basket"
end

post '/basket/create/:user_id' do
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    @basket = Basket.new
    @basket.name = params[:name]
    @basket.ingredients = params[:ingredients]
    @basket.save
    @basket
    binding.pry
    erb :"orders/display_custom_basket"

end

get '/show/customs/:user_id' do
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    erb :"orders/display_baskets"
  end

get '/show/customs/:user_id/edit' do
    
    logged_in_user_id = session[:user_id]
    binding.pry
    @user = User.find_by(id: logged_in_user_id)
    erb :"orders/edit"
end

put '/basket/create/:user_id' do
    binding.pry
    basket = Basket.find_by(id: params[:id])
    basket.name = params[:name]
    basket.ingredients = params[:ingredients]
    basket.save
    binding.pry
    erb :"orders/edit/"
end

delete '/basket/create/:user_id' do
    binding.pry
    basket = Basket.find_by(id: params[:baskets])
    basket.destroy
    erb :"orders/edit"
end

end