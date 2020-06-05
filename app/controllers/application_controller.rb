require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
   # + 'orders'
    #set :views, 'app/views/orders'
    enable :sessions
    set :session_secret, "carcollection"
    #set :views, Proc.new { File.join(root, "templates") }
    set :views, 'app/views'
end

#session hijacking


  get "/" do
    erb :hello
  end

  

 

end
