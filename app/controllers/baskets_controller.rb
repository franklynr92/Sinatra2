class BasketsController < ApplicationController




get '/baskets' do
    if logged_in?
        current_user
        @baskets = Basket.all
        erb :"baskets/index"
    else    
        @error = "Invalid credentials"
        erb :"hello"
    end
end

    

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
    
    redirect to "/baskets/#{@basket.id}"
    end
end

# get '/baskets'

get '/baskets/:id' do
    if logged_in?
        #current_user
    @basket = Basket.find_by(params[:id])
    binding.pry
    # then just render @baskets in the view
    erb :"baskets/show_basket"
    end
end

get '/baskets/:id/custom' do
    binding.pry
    if logged_in?
        current_user
        current_basket
    #@baskets = Basket.find_by(user_id: current_user.id)
    erb :"baskets/index_custom"
end
end


# get '/baskets/edit'
#baskets/:id/edit
#move this to user controller? 
#to answer that question we must ask what is it showing:
# Is it showing something pertaining to baskets or users?
get "/baskets/:id/edit" do
    binding.pry
    if logged_in?
        @baskets = current_basket
        @baskets
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
    find_basket
    find_basket.update
    
    #@basket.name = params[:basket][:name]
    #@basket.ingredients = params[:basket][:ingredients]
    #@basket.save
    redirect to "baskets/edit"
    end
end

# delete "/basket/:id" should be id of basket not user
# follow REST - delete '/basket/:id'
delete '/baskets/:id' do
    #add authorization - is current_user == basket.user?
    #binding.pry
    if logged_in?
        binding.pry
   #@basket = Basket.find_by_id(params[:basket]) 
   find_basket.destroy
    binding.pry
    #@basket.destroy
    redirect to "/baskets"
    end
end


end