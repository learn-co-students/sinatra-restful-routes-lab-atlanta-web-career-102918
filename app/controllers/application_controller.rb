class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :home
  end

  get '/index' do
    erb :index
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do

    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.all.find(params[:id])
    erb :show
  end

  post '/recipes/:id' do
    @recipe = Recipe.all.find(params[:id])
    @recipe.delete
    erb :index
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.all.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.all.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.update
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.all.find(params[:id])
    @recipe.delete
    erb :new
  end

end
