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

        
#new
    get '/baskets/new' do
        #params[:user_id]  == 3
        if logged_in?
            current_user
            erb :"baskets/new"
        end
    end
#show
    get '/baskets/:id' do

        if logged_in?
            current_user
            @basket = Basket.find_by(id: params[:id])
            binding.pry
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
            current_user
            binding.pry
        if  !!basket_made
                created_message
                erb :"baskets/new"
        else
                @basket = Basket.create(params[:basket])
                @basket.user_id = current_user.id
                @basket.save
                binding.pry
                redirect to "/baskets/#{@basket.id}"
        end
    end
    end

    # get '/baskets'
#show creation
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
        if logged_in?
            current_user
            @basket = Basket.find_by(id: params[:id])
            erb :"baskets/edit"
        end
    end



    # put '/basket/:id' basket id should be in url not form 
    # follow REST - put '/basket/:id'
    #update
    put "/baskets/:id" do
        if logged_in?
        #create helper method - set_basket
        current_user
        @basket = Basket.find_by_id(params[:id]) 
        if !!@basket.update(params[:basket])
            updated_message
            redirect to "/baskets/#{@basket.id}"
        end
    end
    end

    # delete "/basket/:id" should be id of basket not user
    # follow REST - delete '/basket/:id'
    delete '/baskets/:id' do
        if logged_in?
        #@basket = Basket.find_by_id(params[:basket]) 
            #find_basket.destroy
            @basket = Basket.find_by_id(params[:id]) 
            if  !!@basket.destroy
                deleted_message
                redirect to "/baskets"
            end
        end
    end

    helpers do
        def basket_made
            Basket.find_by(name: params[:basket][:name])
        end

       

    end
end