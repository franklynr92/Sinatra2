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
            if !basket_made
            @basket = Basket.create(params[:basket])
            @basket.user_id = current_user.id
            @basket.save
            binding.pry
        redirect to "/baskets/#{@basket.id}"
            else
                created_message
                erb :"baskets/new"
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
            @basket = Basket.find_by(id: params[:id])
            erb :"baskets/edit"
        end
    end



    # put '/basket/:id' basket id should be in url not form 
    # follow REST - put '/basket/:id'
    put "/baskets/:id" do
        if logged_in?
        #create helper method - set_basket
        @basket = Basket.find_by_id(params[:id]) 
        @basket.update(params[:basket])
            @basket
            #@basket.name = params[:basket][:name]
            #@basket.ingredients = params[:basket][:ingredients]
            #@basket.save
            updated_message
            redirect to "/baskets/#{@basket.id}"
        end
    end

    # delete "/basket/:id" should be id of basket not user
    # follow REST - delete '/basket/:id'
    delete '/baskets/:id' do
        if logged_in?
        #@basket = Basket.find_by_id(params[:basket]) 
            #find_basket.destroy
            @basket = Basket.find_by_id(params[:id]) 
            @basket.destroy
            deleted_message
            redirect to "/baskets"
        end
    end

    helpers do
        def basket_made
            Basket.all.find_by(name: params[:basket][:name])
        end

        def created_message
            <<-HEREDOC 
        This basket name has been taken. 
            Please pick another name!!
            HEREDOC
        end

        def deleted_message
            <<-HEREDOC 
        This basket has been deleted. 
        Would you like to create another?!!
            HEREDOC
        end
        def updated_message
            <<-HEREDOC 
        This basket has been updated. 
        What would you like to do now?
            HEREDOC
        end

    end
end