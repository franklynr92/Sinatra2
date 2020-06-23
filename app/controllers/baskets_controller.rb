class BasketsController < ApplicationController
#index
    get '/baskets' do
        redirect?
        @baskets = Basket.all
            erb :"baskets/index"
    end

        
#new
    get '/baskets/new' do
        redirect?
            erb :"baskets/new"
    end

#show
    get '/baskets/:id' do
        redirect?
        set_basket
        erb :"baskets/show_basket"
    end

    
    #create
    post '/baskets' do
       redirect?
            @basket = current_user.baskets.new(params[:basket])
        if  @basket.save
            redirect to "/baskets/#{@basket.id}"
        else
            @created_message = created_message
            erb :"baskets/new"
        end
    end

    #edit
    get "/baskets/:id/edit" do
        redirect?
        set_basket
        if compare_basket
            erb :"baskets/edit"
        else
            redirect to "/baskets"
        end  
    end



    #update
    put "/baskets/:id" do
        redirect?
        set_basket
        if compare_basket
            @basket.update(params[:basket])
            redirect to "/baskets/#{@basket.id}"
        else
            redirect to "/baskets/index"
        end
    end

    #destroy
    delete '/baskets/:id' do
        redirect?
        set_basket
        if  compare_basket
            @basket.destroy
            redirect to "/baskets"
        else
            redirect to "/baskets/index"
        end  
    end

    get '/users/:id/baskets' do
        redirect?
        erb :"users/index_custom"
    end
    
    helpers do

        def set_basket
            @basket = Basket.find_by_id(params[:id])
        end

        def compare_basket
            @basket.user_id == current_user.id
        end

    end

end