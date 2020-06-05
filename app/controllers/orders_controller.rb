class OrdersController < ApplicationController



get '/order' do
    erb :"orders/order"
end

post '/show' do
    #pull name from where
    erb :"orders/show"
end


end