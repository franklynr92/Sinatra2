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

    #if @current_user 
    #erb :"orders/order" 

    #get the name of the user to show, possibly use in conjuction
    #with a logged_in? and pull user name || name from there

get '/baskets/new' do
    #params[:user_id]  == 3
    if logged_in?
    current_user
    erb :"baskets/new"
    end
end

#post '/basket'
#better utilize AR methods to create associated records
post '/baskets' do
    # utilize existing helpers
    if logged_in? 
        @basket = Basket.create(params[:basket])
        @basket.user_id = current_user.id
        @basket.save
    #current_basket = Basket.where(user_id: current_user.id)
    #@basket.save
    #@basket
    redirect to "/baskets/#{@basket.id}"
    end
end

# get '/baskets'

get '/baskets/:id' do
    if logged_in?
        
    @basket = Basket.find(params[:id])
    binding.pry
    # then just render @baskets in the view
    erb :"baskets/show"
    end
end


# get '/baskets/edit'
#baskets/:id/edit
#move this to user controller? 
#to answer that question we must ask what is it showing:
# Is it showing something pertaining to baskets or users?
get "/baskets/:id/edit" do
    if logged_in?
        @baskets = current_basket
      binding.pry
    #current_basket.ids

      erb :"baskets/edit"
    end
end



# put '/basket/:id' basket id should be in url not form 
# follow REST - put '/basket/:id'
put "/baskets/:id" do
    if logged_in?
    #create helper method - set_basket
    binding.pry
    @basket = Basket.find_by(id: params[:basket_id])
    
    @basket.name = params[:basket][:name]
    @basket.ingredients = params[:basket][:ingredients]
    @basket.save
    redirect to "baskets/edit"
    end
end

# delete "/basket/:id" should be id of basket not user
# follow REST - delete '/basket/:id'
delete '/baskets/:id' do
    #add authorization - is current_user == basket.user?
    #binding.pry
    if logged_in?
   @basket = Basket.find_by_id(params["basket"]) 
    binding.pry
    @basket.destroy
    redirect to "/baskets"
    end
end

helpers do
    def find_basket
        @basket = Basket.find_by_id(params[:basket_id]) 
    end

    def current_basket
        @current_basket = Basket.where(user_id: current_user.id)
    end
end

end