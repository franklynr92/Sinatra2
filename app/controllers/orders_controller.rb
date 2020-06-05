class OrdersController < ApplicationController



get '/order' do
    erb :"orders/order"
end

post '/show' do
    erb :"orders/show"
end


end