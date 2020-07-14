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
        set_recipe
        erb :'recipes/show'
    end

    get '/recipes/:id/edit' do
        set_recipe
        erb :'recipes/edit'
    end

    patch '/recipes/:id' do
        set_recipe
        if @recipe.update(
            name: params[:recipe][:name],
            ingredients: params[:recipe][:ingredients]
        )
            redirect "/recipes/#{@recipe.id}"
        else
            erb :'/recipes/edit'
        end
    end

    private
        def set_recipe
            @recipe = Recipe.find_by_id(params[:id])
        end

end