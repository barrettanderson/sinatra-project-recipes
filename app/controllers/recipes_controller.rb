class RecipesController < ApplicationController
    get '/recipes' do
        @recipes = Recipe.all
        erb :'recipes/index'
    end

    get '/recipes/new' do
        @recipe = Recipe.new
        erb :'recipes/new'
    end

    post '/recipes' do
        @recipe = Recipe.create(params)
        redirect to "/recipes/#{@recipe.id}"
    end

    get "/recipes/:id" do
        @recipe = Recipe.find(params[:id])
        erb :show
    end

    get "/recipes/:id/edit" do
        @recipe = Recipe.find(params[:id])
        erb :edit
    end
end