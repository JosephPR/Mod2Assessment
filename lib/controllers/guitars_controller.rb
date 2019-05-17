class GuitarsController < Sinatra::Base

  configure do
    set :views, "lib/views"
  end

#root
  get '/' do
 redirect to '/guitars'
  end

  #index
  get '/guitars' do
  @guitars = Guitar.all
    erb :index
  end

#new
  get '/guitars/new' do
    @guitar = Guitar.new
    erb:new
  end

  #create
  post '/guitars' do
    @guitar = Guitar.create({
       name: params[:name],
       body: params[:body]
    })
      redirect "/guitars/#{@guitar.id}"
  end

  #show
  get "/guitars/:id" do
    @guitar = Guitar.find(params[:id])
    erb :show
  end

  #load edit form
  get '/guitars/:id/edit' do
    @guitar = Guitar.find(params[:id])
    erb :edit
  end

  # update(edit)
  patch "/guitars/:id"  do
    @guitar = Guitar.find(params[:id])
    @guitar.update(
      name: params[:guitar][:name],
      body: params[:guitar][:body]
    )
    redirect "/guitars"
  end

  #destroy
  delete '/guitars/:id' do #delete action
    @guitar = Guitar.find(params[:id])
    @guitar.delete
    redirect to '/guitars'
  end

end
