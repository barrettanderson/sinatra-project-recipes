class RecipesController < ApplicationController
    use Rack::Flash
    
    get '/recipes' do
        @recipes = current_user.recipes
        erb :'recipes/index'
    end

    get '/recipes/new' do
        @recipe = Recipe.new
        erb :'recipes/new'
    end

    post '/recipes' do
        @recipe = current_user.recipes.build(params[:recipe])
        if @recipe.save
            redirect to "/recipes/#{@recipe.id}"
        else
            flash.now[:error] = @recipe.errors.full_messages
            erb :'recipes/new'
        end
    end

    get '/recipes/:id' do
        set_recipe
        erb :'recipes/show'
    end

    get '/recipes/:id/edit' do
        set_recipe
        if current_user == @recipe.user
            erb :'recipes/edit'
        else
            redirect '/recipes'
        end
    end

    patch '/recipes/:id' do
        set_recipe
        if current_user == @recipe.user && @recipe.update(
            name: params[:recipe][:name],
            ingredients: params[:recipe][:ingredients]
        )
            redirect "/recipes/#{@recipe.id}"
        else
            erb :'/recipes/edit'
        end
    end

    delete '/recipes/:id' do
        set_recipe
        if current_user == @recipe.user
            @recipe.destroy
        end
        redirect '/recipes'
    end

    private
        def set_recipe
            @recipe = Recipe.find_by_id(params[:id])
        end

end