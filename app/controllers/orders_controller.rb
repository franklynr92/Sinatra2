class OrdersController < ApplicationController



get '/order' do
    erb :"orders/order"
    #get the name of the user to show, possibly use in conjuction
    #with a logged_in? and pull user name || name from there
end

post '/show' do
    #pull name from where
    #currently no data is coming out from "basket" figure out why
    @pick_a_basket = params[:basket]
    binding.pry
    #@ingredients_are = Basket.find_by_sql("SELECT ingredients FROM baskets WHERE name = 'Birthday'")
    Basket.all.select{|ingredients| ingredients.include?(@pick_a_basket)}
    @ingredients_are = Basket.find_by_sql("SELECT ingredients FROM baskets WHERE name = 'Birthday'")
    Basket.find_by_name(@pick_a_basket)
    
    #Basket.find_by(:ingredients => @pick_a_basket => :id)
    
    #find ingredients by their id that is equal to params[:basket] id
    erb :"orders/show"
end




end