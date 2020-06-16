class BasketsController < ApplicationController


# '/users/:id/orders 

get '/baskets' do
    if logged_in?
        current_user
        erb :"baskets/index"
    else    
        @error = "Invalid credentials"
        erb :"hello"
    end
end
=begin
get '/orders' do
    erb :"baskets/display"
end
=end
    #if @current_user 
    #erb :"orders/order" 

    #get the name of the user to show, possibly use in conjuction
    #with a logged_in? and pull user name || name from there

=begin
#  post '/orders
post '/show' do
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
    #this should be use on the orders controller
    #Basket.find_by(:ingredients => @pick_a_basket => :id)
    
    #find ingredients by their id that is equal to params[:basket] id
    erb :"baskets/show" #id
end
=end
get '/basket/new' do
    #params[:user_id]  == 3
    current_user
    erb :"baskets/new"
end

#post '/basket'
#better utilize AR methods to create associated records
post '/basket/create' do
    # utilize existing helpers
   current_user
    
    @basket = Basket.create(params)
    binding.pry
    #@basket.name = params[:name]
    #@basket.ingredients = params[:ingredients]
    @basket.user_id = current_user.id
    #current_basket = Basket.where(user_id: current_user.id)
    #@basket.save
    #@basket
    erb :"baskets/display_creation"
end

# get '/baskets'
=begin
get '/show/all_baskets' do
    current_user
    @baskets = current_user.baskets
    # then just render @baskets in the view
    erb :"baskets/display"
end
=end

# get '/baskets/edit'
#baskets/:id/edit
get '/show/:user_id/edit' do
    if current_user
        @baskets = current_basket
      binding.pry
    #current_basket.ids

      erb :"baskets/edit"
    end
end

# put '/basket/:id' basket id should be in url not form 
# follow REST - put '/basket/:id'
put '/baskets/:user_id' do
    #create helper method - set_basket
    basket = Basket.find_by(id: params[:id])
    #find_basket
    binding.pry
    #find_basket.update
    #basket.update
    
    #AR .update
    basket.name = params[:name]
    basket.ingredients = params[:ingredients]
    basket.save
    redirect "baskets/display"
    
end

# delete "/basket/:id" should be id of basket not user
# follow REST - delete '/basket/:id'
delete '/basket/:user_id' do
    #add authorization - is current_user == basket.user?
   # binding.pry
   @basket = Basket.find_by_id(params[:baskets]) 
    binding.pry
    @basket.destroy
    redirect "baskets/display"
end

helpers do
    def find_basket
        @basket = Basket.find_by_id(params[:baskets]) 
    end

    def current_basket
        @current_basket = Basket.where(user_id: current_user.id)
    end
end

end