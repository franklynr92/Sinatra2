class BasketsController < ApplicationController


# '/users/:id/orders 

get '/basket/:user_id' do
    if logged_in?
    @user = User.find_by(id: session[:user_id])
        erb :"baskets/all"
    else    
        @error = "Invalid credentials"
        erb :"hello"
    end
end
   
    
    #if @current_user 
    #erb :"orders/order" 

    #get the name of the user to show, possibly use in conjuction
    #with a logged_in? and pull user name || name from there


#  post '/orders
post '/show/:user_id' do
    #binding.pry
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
    erb :"baskets/show" #id
end

get '/basket/new' do
    #params[:user_id]  == 3
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    erb :"orders/new"
end

#post '/basket'
post '/basket/create' do
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    @basket = Basket.new
    @basket.name = params[:name]
    @basket.ingredients = params[:ingredients]
    #binding.pry
    @basket.user_id = current_user.id
    @basket.save
    @basket
    erb :"baskets/display_custom"

end

# get '/baskets'
get '/show/customs' do
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    erb :"baskets/display"
end


# get '/baskets/edit'

get '/show/customs/edit' do
    
    logged_in_user_id = session[:user_id]

    @user = User.find_by(id: logged_in_user_id)
    erb :"baskets/edit"
end

# put '/basket/:id' basket id should be in url not form 
put '/basket/create/:user_id' do
    
    basket = Basket.find_by(id: params[:id])
    #binding.pry
    basket.name = params[:name]
    basket.ingredients = params[:ingredients]
    basket.save
    
    erb :"baskets/display"
end

# delete "/basket/:id" should be id of basket not user
delete '/basket/create/:user_id' do
   # binding.pry
    basket = Basket.find_by(id: params[:baskets])
    basket.destroy
    erb :"baskets/display"
end

end