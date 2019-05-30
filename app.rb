require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    # post methods always return data back to the server from the user
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])


      params[:pirate][:ships].each do |params|
        Ship.new(params)
      end

      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
