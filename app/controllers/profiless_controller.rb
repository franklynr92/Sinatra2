class ProfilesController < ApplicationController

  # GET: /profiles
  get "/profiles" do
    erb :"/profiles/index.html"
  end

  # GET: /profiles/new
  get "/profiles/new" do
    erb :"/profiles/new.html"
  end

  # POST: /profiles
  post "/profiles" do
    redirect "/profiles"
  end

  # GET: /profiles/5
  get "/profiles/:id" do
    erb :"/profiles/show.html"
  end

  # GET: /profiles/5/edit
  get "/profiles/:id/edit" do
    erb :"/profiles/edit.html"
  end

  # PATCH: /profiles/5
  patch "/profiles/:id" do
    redirect "/profiles/:id"
  end

  # DELETE: /profiles/5/delete
  delete "/profiles/:id/delete" do
    redirect "/profiles"
  end
end
