class BasketsController < ApplicationController

    get '/baskets' do
        if logged_in?
            #current_user
            @baskets = Basket.all
            erb :"baskets/index"
        else    
            @error = "Invalid credentials"
            erb :"hello"
        end
    end

        
#new
    get '/baskets/new' do
        #params[:user_id]  == 3
        if logged_in?
            #current_user
            erb :"baskets/new"
        end
    end

#show
    get '/baskets/:id' do
        if logged_in?
            #current_user
            #@basket = Basket.find_by(id: params[:id])
            set_basket
            #binding.pry
            # then just render @baskets in the view
            erb :"baskets/show_basket"
        end
    end

    #post '/basket'
    #better utilize AR methods to create associated records
    #create
    post '/baskets' do
        # utilize existing helpers
        if logged_in? 
            binding.pry
            @basket = Basket.new(params[:basket])
            @basket.user_id = current_user.id
        if  @basket.save
            redirect to "/baskets/#{@basket.id}"
        else
            @created_message = created_message
            erb :"baskets/new"
                     # binding.pry
        end
    end
    end

    # get '/baskets'

    # get '/baskets/edit'
    #baskets/:id/edit
    #move this to user controller? 
    #to answer that question we must ask what is it showing:
    #Is it showing something pertaining to baskets or users?
    get "/baskets/:id/edit" do
        if logged_in?
            set_basket
            #@basket = Basket.find_by(id: params[:id])# helper method
           # binding.pry
            if @basket.user_id == current_user.id
                erb :"baskets/edit"
            else
                redirect to "/baskets"
            end    
        end
    end



    # put '/basket/:id' basket id should be in url not form 
    # follow REST - put '/basket/:id'
    #update
    put "/baskets/:id" do
        if logged_in?
        #create helper method - set_basket
            @basket = Basket.find_by_id(params[:id]) 
           # binding.pry
            if @basket.user_id == current_user.id
                @basket.update(params[:basket])
                redirect to "/baskets/#{@basket.id}"
            else
                redirect to "/baskets/index"
            end
        end
    end

    # delete "/basket/:id" should be id of basket not user
    # follow REST - delete '/basket/:id'
    delete '/baskets/:id' do
        if logged_in?
            #@basket = Basket.find_by_id(params[:id]) 
            set_basket
            if  @basket.user_id == current_user.id
                !!@basket.destroy
                redirect to "/baskets"
            end
        end  
    end
    
    helpers do

        def set_basket
            @basket = Basket.find_by_id(params[:id])
        end
    end

end