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
        @recipe = Recipe.new(params[:recipe])
        # binding.pry
        if @recipe.save
            redirect to "/recipes/#{@recipe.id}"
        else
            erb :'recipes/new'
        end
    end

    get '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :'recipes/show'
    end

    # get "/recipes/:id/edit" do
    #     @recipe = Recipe.find(params[:id])
    #     erb :edit
    # end
end